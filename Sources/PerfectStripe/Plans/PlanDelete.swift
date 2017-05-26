//
//  PlanDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripePlan {

	/// You can delete plans via the plan management page of the Stripe dashboard. However, deleting a plan does not affect any current subscribers to the plan; it merely means that new subscribers can’t be added to that plan. You can also delete plans via the API.
	public func delete() throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		// execute request
		let (response, code) = Stripe.makeRequest(.delete, "/plans/\(id)")

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
