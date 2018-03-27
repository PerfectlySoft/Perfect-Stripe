//
//  CustomerUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//

import PerfectHTTP

extension Stripe {
	/// Updates the specified customer by setting the values of the parameters passed.
	/// Any parameters not provided will be left unchanged.
	/// For example, if you pass the source parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future.
	/// When you update a customer to a new valid source: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the past_due state, then the latest unpaid, unclosed invoice for the subscription will be retried (note that this retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice). (Note also that no invoices pertaining to subscriptions in the unpaid state, or invoices pertaining to canceled subscriptions, will be retried as a result of updating the customer’s source.)
	public static func customerUpdate(_ customer: Customer, coupon: String = "") throws -> Customer {

		guard !customer.id.isEmpty else {
			throw StripeInputError.invalidInput(description: "A customer ID value must be supplied.")
		}


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
		if customer.metadata != nil, (customer.metadata?.count ?? 0) > 0 {
			params["metadata"] = customer.metadata
		}

		if customer.shipping != nil {
			params["shipping"] = customer.shipping
		}


		guard params.count > 0 else {
			throw StripeInputError.invalidInput(description: "At least one parameter must be specified.")
		}

		// execute request
		let response = try Stripe.makeRequest(.post, "/customers/\(customer.id)", params: params)
		return try response.bodyJSON(Customer.self)
	}
}




