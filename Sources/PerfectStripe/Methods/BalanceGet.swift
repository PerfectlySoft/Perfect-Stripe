//
//  Balance.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

import PerfectHTTP

extension Stripe {
	/// Retrieves the current balance for the authenticated user
	public static func balanceFetch() throws -> Balance {
		// execute request
		let response = try Stripe.makeRequest(.get, "/balance")
		return try response.bodyJSON(Balance.self)
	}
}
