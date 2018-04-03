//
//  Balance.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

import PerfectHTTP
import codableRequest

extension Stripe {
	/// Retrieves the current balance for the authenticated user
	public static func balanceFetch() throws -> Balance {
		// execute request
		do {
			let response: Balance = try CodableRequest.request(HTTPMethod.get, "\(Stripe.server)/balance", to: Balance.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}
	}

}
