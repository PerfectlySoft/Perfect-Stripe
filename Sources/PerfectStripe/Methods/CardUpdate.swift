//
//  CardUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {
	/// Updates the specified card by setting the values of the parameters passed.
	/// Any parameters not provided will be left unchanged.
	public static func cardUpdate(customer: String, card: Card) throws -> Card {

		guard !card.id.isEmpty else {
			throw StripeInputError.invalidInput(description: "A card ID value must be supplied.")
		}


		var params = [String: Any]()

		/// An integer amount in cents that is the starting account balance for your customer. A negative amount represents a credit that will be used before attempting any charges to the customer’s card; a positive amount will be added to the next invoice.
		if let address_city = card.address_city, !address_city.isEmpty {
			params["address_city"] = card.address_city
		}
		if let address_country = card.address_country, !address_country.isEmpty {
			params["address_country"] = card.address_country
		}
		if let address_line1 = card.address_line1, !address_line1.isEmpty {
			params["address_line1"] = card.address_line1
		}
		if let address_line2 = card.address_line2, !address_line2.isEmpty {
			params["address_line2"] = card.address_line2
		}
		if let address_state = card.address_state, !address_state.isEmpty {
			params["address_state"] = card.address_state
		}
		if let address_zip = card.address_zip, !address_zip.isEmpty {
			params["address_zip"] = card.address_zip
		}
		if let exp_month = card.exp_month, exp_month > 0 {
			params["exp_month"] = card.exp_month
		}
		if let exp_year = card.exp_year, exp_year > 0 {
			params["exp_year"] = card.exp_year
		}
		if let metadata = card.metadata, metadata.count > 0 {
			params["metadata"] = card.metadata
		}
		if let name = card.name, !name.isEmpty {
			params["name"] = card.name
		}

		guard params.count > 0 else {
			throw StripeInputError.invalidInput(description: "At least one parameter must be specified.")
		}

		// execute request
		do {
			let response: Card = try CodableRequest.request(.post, "\(Stripe.server)/customers/\(customer)/sources/\(card.id)", to: Card.self, error: ErrorResponse.self, params: params, encoding: "form", bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}

