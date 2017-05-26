//
//  PlanUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripePlan {

	/// Updates the name of a plan. Other plan details (price, interval, etc.) are, by design, not editable.
	public func update() throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		var params = [String: Any]()
		if !name.isEmpty { params["name"] = name } else {
			throw InvalidInput()
		}
		if !metadata.isEmpty { params["metadata"] = metadata }
		params["statement_descriptor"] = statement_descriptor
		params["trial_period_days"] = trial_period_days

		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/plans/\(id)", params: params)

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
