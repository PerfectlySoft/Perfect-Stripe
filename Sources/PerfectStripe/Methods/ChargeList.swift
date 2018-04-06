//
//  ChargeList.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

import PerfectHTTP
import codableRequest

extension Stripe {

	// container for response
	public struct ChargesList: Codable {
		public var object				= "list"
		public var url					= "/v1/charges"
		public var has_more				= false
		public var data:				[Charge]?
	}

	public enum chargeSourceList: String, Codable {
		case all, alipay_account, bank_account, bitcoin_receiver, card
	}

	public static func chargeList(
		limit: Int = 10,
		customer: String = "",
		ending_before: String = "",
		starting_after: String = "",
		transfer_group: String = "",
		source: chargeSourceList = .all
		) throws -> ChargesList {

		var params = [String]()
		if !customer.isEmpty { params.append("customer=\(customer)") }
		if !ending_before.isEmpty { params.append("ending_before=\(ending_before)") }
		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }

		if !starting_after.isEmpty { params.append("starting_after=\(starting_after)") }
		if !transfer_group.isEmpty { params.append("transfer_group=\(transfer_group)") }

		params.append("source[object]=\(source)")

		// execute request
		do {
			let response: ChargesList = try CodableRequest.request(.get, "\(Stripe.server)/charges?\(params.joined(separator: "&"))", to: ChargesList.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}
	}
}

