//
//  CustomerGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//

import PerfectHTTP
import codableRequest

extension Stripe {
	/// Creates a new customer object
	/// Follows conventions at https://stripe.com/docs/api/curl#create_customer
	/// - coupon is not part of the customer object, therefore it is specified as an incoming parameter
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
