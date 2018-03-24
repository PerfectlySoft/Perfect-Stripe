//
//  BalanceGetTransaction.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-24.
//

import PerfectHTTP

extension Stripe {

	/// Returns a specific BalanceTransaction
	public static func balanceTransaction(_ id: String) throws -> BalanceTransaction {
		// execute request
		let response = try Stripe.makeRequest(.get, "/balance/history/\(id)")
		return try response.bodyJSON(BalanceTransaction.self)
	}

}


