//
//  SubscriptionItemUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeSubscriptionItem {

	/// Updates the name of a plan. Other plan details (price, interval, etc.) are, by design, not editable.
	public func update(
		planid: String = "",
		prorate: Bool = false,
		proration_date: Int = -1,
		quantity: Int = -1
		) throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		var params = [String: Any]()
		if id.isEmpty {
			throw InvalidInput()
		}
		if !planid.isEmpty { params["plan"] = planid }
		if prorate == true { params["prorate"] = prorate }
		if proration_date > -1 { params["proration_date"] = proration_date }
		if quantity > -1 { params["quantity"] = quantity }

		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/subscription_items/\(id)", params: params)

		if code != 200 {
			print("StripeSubscriptionItem.update Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
