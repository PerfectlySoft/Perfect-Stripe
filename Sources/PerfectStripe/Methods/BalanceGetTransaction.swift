//
//  BalanceGetTransaction.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-24.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	/// Returns a specific BalanceTransaction
	public static func balanceTransaction(_ id: String) throws -> BalanceTransaction {
		// execute request
		do {
			let response: BalanceTransaction = try CodableRequest.request(.get, "\(Stripe.server)/balance/history/\(id)", to: BalanceTransaction.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}
	}

}


