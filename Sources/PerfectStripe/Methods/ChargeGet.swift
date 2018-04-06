//
//  ChargeGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	/// Retrieves charge object
	public static func chargeGet(_ id: String, customer: String) throws -> Charge {

		// execute request
		do {
			let response: Charge = try CodableRequest.request(HTTPMethod.get, "\(Stripe.server)/customers/\(customer)/sources/\(id)", to: Charge.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}
