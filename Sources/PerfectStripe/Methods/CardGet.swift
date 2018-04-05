//
//  CardGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	/// Retrieves customer object
	public static func cardGet(_ id: String, customer: String) throws -> Card {

		// execute request
		do {
			let response: Card = try CodableRequest.request(HTTPMethod.get, "\(Stripe.server)/customers/\(customer)/sources/\(id)", to: Card.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}
