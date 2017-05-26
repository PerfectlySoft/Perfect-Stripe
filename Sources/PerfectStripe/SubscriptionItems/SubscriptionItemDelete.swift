//
//  SubscriptionItemDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeSubscriptionItem {

	/// You can delete plans via the plan management page of the Stripe dashboard. However, deleting a plan does not affect any current subscribers to the plan; it merely means that new subscribers can’t be added to that plan. You can also delete plans via the API.
	public func delete(
		prorate: Bool = false,
		proration_date: Int = -1
		) throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		var params = [String]()
		if prorate == true { params.append("prorate=\(prorate)") }
		if proration_date > -1 { params.append("proration_date=\(proration_date)") }

		// execute request
		let (response, code) = Stripe.makeRequest(.delete, "/subscription_items/\(id)?\(params.joined(separator: "&"))")

		if code != 200 {
			print("StripeSubscriptionItem.delete Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
