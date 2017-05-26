//
//  PlanGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripePlan {
	/// Retrieves the plan with the given ID.
	public func get(_ id: String) {
		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/plans/\(id)")

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
