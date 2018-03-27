//
//  CustomerCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-30.
//
//

import PerfectHTTP

extension Stripe {
	/// Creates a new customer object
	/// Follows conventions at https://stripe.com/docs/api/curl#create_customer
	/// - coupon is not part of the customer object, therefore it is specified as an incoming parameter
	public static func customerCreate(_ customer: Customer, coupon: String = "") throws -> Customer {

		var params = [String: Any]()

		/// An integer amount in cents that is the starting account balance for your customer. A negative amount represents a credit that will be used before attempting any charges to the customer’s card; a positive amount will be added to the next invoice.
		if customer.account_balance != 0 {
			params["account_balance"] = customer.account_balance
		}

		if customer.business_vat_id != nil {
			params["business_vat_id"] = customer.business_vat_id
		}

		/// If you provide a coupon code, the customer will have a discount applied on all recurring charges. Charges you create through the API will not have the discount.
		if !coupon.isEmpty { params["coupon"] = coupon }

		if customer.default_source != nil {
			params["default_source"] = customer.default_source
		}
		if customer.description != nil {
			params["description"] = customer.description
		}
		if customer.email != nil {
			params["email"] = customer.email
		}
		if customer.metadata != nil {
			params["metadata"] = customer.metadata
		}

		// execute request
		let response = try Stripe.makeRequest(.post, "/customers", params: params)
		return try response.bodyJSON(Customer.self)
	}
}



