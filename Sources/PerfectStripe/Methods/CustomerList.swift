//
//  CustomerList.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	// container for response
	public struct CustomerList: Codable {
		public var object				= "list"
		public var url					= "/v1/customers"
		public var has_more				= false
		public var data:				[Customer]?
	}

	/// Deletes a customer object
	public static func customerList(limit: Int = 10, email: String = "", ending_before: String = "", starting_after: String = "") throws -> CustomerList? {

		var params = "?limit=\(limit)"
		if !email.isEmpty {
			params += "&email=\(email)"
		}
		if !ending_before.isEmpty {
			params += "&ending_before=\(ending_before)"
		}
		if !starting_after.isEmpty {
			params += "&starting_after=\(starting_after)"
		}

		// execute request
		do {
			let response: CustomerList = try CodableRequest.request(.get, "\(Stripe.server)/customers\(params)", to: CustomerList.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}
