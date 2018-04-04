//
//  BalanceHistory.swift
//  PerfectStripePackageDescription
//
//  Created by Jonathan Guthrie on 2018-03-23.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	// container for list
	private struct BalanceHistory: Codable {
		public var object				= "list"
		public var url					= "/v1/balance/history"
		public var has_more				= false
		public var data:				[BalanceTransaction]?
	}

	/// Returns a BalanceTransaction array
	public static func balanceHistory(limit: Int = 10, currency: String = "", type: Stripe.TransactionType = .none) throws -> [BalanceTransaction] {
		// make params
		var params = [String]()
		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }
		if !currency.isEmpty { params.append("currency=\(currency)") }
		if type != .none { params.append("type=\(type.rawValue)") }

		// execute request
		do {
			let response: BalanceHistory = try CodableRequest.request(.get, "\(Stripe.server)/balance/history?\(params.joined(separator: "&"))", to: BalanceHistory.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response.data ?? [BalanceTransaction]()
		} catch {
			throw error
		}
	}

}

