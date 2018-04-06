//
//  CardCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-28.
//

import PerfectHTTP
import PerfectCURL
import codableRequest
import PerfectLib
import Foundation

extension Stripe {
	/// When you create a new credit card, you must specify a customer or recipient on which to create it.
	/// If the card's owner has no default card, then the new card will become the default.
	/// However, if the owner already has a default, then it will not change.
	/// To change the default, you should either update the customer to have a new default_source, or update the recipient to have a new default_card.
	/// https://stripe.com/docs/api/curl#create_card
	/// This first method is the simplest: It takes a custoer id, source, and an optional metadata dictionary and creates a card object
	public static func cardCreateSource(customer: String, source: String, metadata: [String: String]?) throws -> Card {

		var params:[String: Any] = ["source": source]
		if metadata != nil {
			params["metadata"] = metadata
		}

		do {
			let response: Card = try CodableRequest.request(.post, "\(Stripe.server)/customers/\(customer)/sources", to: Card.self, error: ErrorResponse.self, json: params, encoding: "form", bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}




	public static func cardCreate(customer: String, card: Card) throws -> Card {
//		let cardparams = try JSONSerialization.jsonObject(with: try JSONEncoder().encode(card), options: []) as? [String : Any] ?? [String: Any]()

		guard card.exp_month != nil else {
			throw StripeInputError.invalidInput(description: "A exp_month value must be supplied.")
		}
		guard card.exp_year != nil else {
			throw StripeInputError.invalidInput(description: "A exp_year value must be supplied.")
		}
		guard card.number != nil else {
			throw StripeInputError.invalidInput(description: "A card number value must be supplied.")
		}
		guard card.currency != nil else {
			throw StripeInputError.invalidInput(description: "A currency value must be supplied.")
		}

//		var params = [String: Any]()

		var cardparams: [String: Any] = ["source[object]": "card", "source[exp_month]": card.exp_month ?? 0, "source[exp_year]": card.exp_year ?? 0, "source[number]": card.number ?? ""]
		if card.address_city != nil {
			cardparams["source[address_city]"] = card.address_city
		}
		if card.address_country != nil {
			cardparams["source[address_country]"] = card.address_country
		}
		if card.address_line1 != nil {
			cardparams["source[address_line1]"] = card.address_line1
		}
		if card.address_line2 != nil {
			cardparams["source[address_line2]"] = card.address_line2
		}
		if card.address_state != nil {
			cardparams["source[address_state]"] = card.address_state
		}
		if card.address_zip != nil {
			cardparams["source[address_zip]"] = card.address_zip
		}
		if card.currency != nil {
			cardparams["source[currency]"] = card.currency
		}
		if card.cvc != nil {
			cardparams["source[cvc]"] = card.cvc
		}
		if card.default_for_currency != nil {
			cardparams["source[default_for_currency]"] = card.default_for_currency
		}
		if card.metadata != nil {
			cardparams["source[metadata]"] = card.metadata
		}
		if card.name != nil {
			cardparams["source[name]"] = card.name
		}



//		let params:[String: Any] = ["source": cardparams]
//		if metadata != nil {
//			params["metadata"] = metadata
//		}
//		let x = try params.jsonEncodedString()
		do {
			let response: Card = try CodableRequest.request(.post, "\(Stripe.server)/customers/\(customer)/sources", to: Card.self, error: ErrorResponse.self, params: cardparams, encoding: "form", bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}
	}
}


