//
//  CardCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-28.
//

import PerfectHTTP
import PerfectCURL
import codableRequest

extension Stripe {
	/// When you create a new credit card, you must specify a customer or recipient on which to create it.
	/// If the card's owner has no default card, then the new card will become the default.
	/// However, if the owner already has a default, then it will not change.
	/// To change the default, you should either update the customer to have a new default_source, or update the recipient to have a new default_card.
	/// https://stripe.com/docs/api/curl#create_card
	/// This first method is the simplest: It takes a custoer id, source, and an optional metadata dictionary and creates a card object
	public static func cardCreate(customer: String, source: String, metadata: [String: String]?) throws -> Card {

		var params:[String: Any] = ["source": source]
		if metadata != nil {
			params["metadata"] = metadata
		}

		do {
			let response: Card = try CodableRequest.request(.post, "\(Stripe.server)/customers/\(customer)/sources", to: Card.self, error: ErrorResponse.self, params: params, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}




	public static func cardCreate(customer: String, card: Card) throws -> Card {

		var params = [String: Any]()
//		guard card.amount > 0 else {
//			throw StripeInputError.invalidInput(description: "Charged amount must be greater than zero.")
//		}
//		guard let currency = card.currency, !currency.isEmpty else {
//			throw StripeInputError.invalidInput(description: "Charged currency must not be empty.")
//		}
//		let source = card.source ?? ""
//		let customer = card.customer ?? ""
//		if source.isEmpty, customer.isEmpty {
//			throw StripeInputError.invalidInput(description: "One of either 'source' or 'customer' must be used.")
//		}

//		params["amount"] = charge.amount
//		params["currency"] = charge.currency
//		// Connect only
//		if charge.application_fee > 0 {
//			params["application_fee"] = charge.application_fee
//		}
//		if charge.captured == false {
//			params["captured"] = false
//		}
//		if let description = charge.description, !description.isEmpty {
//			params["description"] = charge.description
//		}
//		// Connect only
//		if charge.destination != nil {
//			params["destination"] = charge.destination
//		}
//		// Connect only
//		if let transfer_group = charge.transfer_group, !transfer_group.isEmpty {
//			params["transfer_group"] = charge.transfer_group
//		}
//		// Connect only
//		if let on_behalf_of = charge.on_behalf_of, !on_behalf_of.isEmpty {
//			params["on_behalf_of"] = charge.on_behalf_of
//		}
//		if charge.metadata != nil {
//			params["metadata"] = charge.metadata
//		}
//		if let receipt_email = charge.receipt_email, !receipt_email.isEmpty {
//			params["receipt_email"] = charge.receipt_email
//		}
//		if charge.shipping != nil {
//			params["shipping"] = charge.shipping
//		}
//		if !customer.isEmpty {
//			params["customer"] = charge.customer
//		} else {
//			params["source"] = charge.source
//		}
//		if let statement_descriptor = charge.statement_descriptor, !statement_descriptor.isEmpty {
//			params["statement_descriptor"] = charge.statement_descriptor
//		}


		do {
			let response: Card = try CodableRequest.request(.post, "\(Stripe.server)/customers", to: Card.self, error: ErrorResponse.self, params: params, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}
	}
}


