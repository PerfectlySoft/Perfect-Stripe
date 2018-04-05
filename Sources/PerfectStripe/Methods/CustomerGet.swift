//
//  CustomerGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//

import PerfectHTTP
import codableRequest

extension Stripe {
	
	/// Retrieves customer object
	public static func customerGet(_ id: String) throws -> Customer {

		// execute request
		do {
			let response: Customer = try CodableRequest.request(HTTPMethod.get, "\(Stripe.server)/customers/\(id)", to: Customer.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}
