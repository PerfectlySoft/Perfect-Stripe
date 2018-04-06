//
//  ChargeCapture.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

import PerfectHTTP
import codableRequest

extension Stripe {

	/// Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you created a charge with the capture option set to false.
	/// Uncaptured payments expire exactly seven days after they are created. If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.
	public static func chargeCapture(_ charge: Charge) throws -> Charge {

		var params = [String: Any]()
		if (charge.amount ?? 0) > 0 { params["amount"] = charge.amount }
		if (charge.application_fee ?? 0) > 0 { params["application_fee"] = charge.application_fee }
		if (charge.destination?.amount ?? 0) > 0 { params["destination[amount]"] = charge.destination?.amount }
		if !(charge.receipt_email ?? "").isEmpty { params["receipt_email"] = charge.receipt_email }
		if !(charge.statement_descriptor ?? "").isEmpty { params["statement_descriptor"] = charge.statement_descriptor }

		guard params.count > 0 else {
			throw StripeInputError.invalidInput(description: "At least one parameter must be specified.")
		}

		// execute request
		do {
			let response: Charge = try CodableRequest.request(.post, "\(Stripe.server)/charges/\(charge.id ?? "")/capture", to: Charge.self, error: ErrorResponse.self, params: params, encoding: "form", bearerToken: Stripe.apiKey)
			return response
		} catch {
			throw error
		}

	}
}

