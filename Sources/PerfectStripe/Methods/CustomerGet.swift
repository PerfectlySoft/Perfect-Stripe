//
//  CustomerGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//

import PerfectHTTP

extension Stripe {
	/// Creates a new customer object
	/// Follows conventions at https://stripe.com/docs/api/curl#create_customer
	/// - coupon is not part of the customer object, therefore it is specified as an incoming parameter
	public static func customerGet(_ id: String) throws -> Customer {

		// execute request
		let response = try Stripe.makeRequest(.get, "/customers/\(id)")
		return try response.bodyJSON(Customer.self)
	}
}
