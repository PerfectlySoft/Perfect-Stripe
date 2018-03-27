//
//  ChargeCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-26.
//

import PerfectHTTP

extension Stripe {
	/// To charge a credit card or other payment source, you create a Charge object.
	/// If your API key is in test mode, the supplied payment source (e.g., card) won't actually be charged, although everything else will occur as if in live mode. (Stripe assumes that the charge would have completed successfully).
	/// - Takes a Charge object with arguments as specified in https://stripe.com/docs/api/curl#create_charge
	/// - amount, currency are the only ones strictly required
	/// - however, EITHER source or customer is required
	public static func chargeCreate(_ charge: Charge) throws -> Charge {

		var params = [String: Any]()
		guard charge.amount > 0 else {
			throw StripeInputError.invalidInput(description: "Charged amount must be greater than zero.")
		}
		guard !charge.currency.isEmpty else {
			throw StripeInputError.invalidInput(description: "Charged currency must not be empty.")
		}
		guard !charge.source.isEmpty, !charge.customer.isEmpty else {
			throw StripeInputError.invalidInput(description: "One of either 'source' or 'customer' must be used.")
		}

		params["amount"] = charge.amount
		params["currency"] = charge.currency
		// Connect only
		if charge.application_fee > 0 {
			params["application_fee"] = charge.application_fee
		}
		if charge.captured == false {
			params["captured"] = false
		}
		if !charge.description.isEmpty {
			params["description"] = charge.description
		}
		// Connect only
		if charge.destination != nil {
			params["destination"] = charge.destination
		}
		// Connect only
		if !charge.transfer_group.isEmpty {
			params["transfer_group"] = charge.transfer_group
		}
		// Connect only
		if !charge.on_behalf_of.isEmpty {
			params["on_behalf_of"] = charge.on_behalf_of
		}
		if !charge.metadata.isEmpty {
			params["metadata"] = charge.metadata
		}
		if !charge.receipt_email.isEmpty {
			params["receipt_email"] = charge.receipt_email
		}
		if charge.shipping != nil {
			params["shipping"] = charge.shipping
		}
		if !charge.customer.isEmpty {
			params["customer"] = charge.customer
		} else {
			params["source"] = charge.source
		}
		if !charge.statement_descriptor.isEmpty {
			params["statement_descriptor"] = charge.statement_descriptor
		}


		// execute request
		let response = try Stripe.makeRequest(.post, "/charges", json: params)
		return try response.bodyJSON(Charge.self)
	}
}

