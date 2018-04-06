//
//  ChargeUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {
	/// Updates the specified charge by setting the values of the parameters passed.
	/// Any parameters not provided will be left unchanged.
	public static func chargeUpdate(_ charge: Charge) throws -> Charge {

		guard !(charge.id ?? "").isEmpty else {
			throw StripeInputError.invalidInput(description: "A Charge ID value must be supplied.")
		}

		var params = [String: Any]()

		if charge.description != nil {
			params["description"] = charge.description
		}
		if charge.fraud_details != nil, (charge.fraud_details?.count ?? 0) > 0 {
			params["fraud_details"] = charge.fraud_details
		}
		if charge.metadata != nil, (charge.metadata?.count ?? 0) > 0 {
			params["metadata"] = charge.metadata
		}
		if charge.receipt_email != nil {
			params["receipt_email"] = charge.receipt_email
		}
		if charge.shipping != nil {
			params["shipping"] = charge.shipping
		}
		if charge.transfer_group != nil {
			params["transfer_group"] = charge.transfer_group
		}

		guard params.count > 0 else {
			throw StripeInputError.invalidInput(description: "At least one parameter must be specified.")
		}

		// execute request
		do {
			let response: Charge = try CodableRequest.request(.post, "\(Stripe.server)/charges/\(charge.id ?? "")", to: Charge.self, error: ErrorResponse.self, params: params, encoding: "form", bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}
