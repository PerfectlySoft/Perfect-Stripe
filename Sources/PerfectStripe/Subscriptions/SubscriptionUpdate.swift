//
//  SubscriptionUpdate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeSubscription {

	/// Updates an existing subscription to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the upcoming invoice endpoint.
	public func update(
		application_fee_percent: Double = 0.00,
		coupon: String = "",
		items: [StripeSubscriptionItem] = [StripeSubscriptionItem](),
		metadata: [String: Any] = [String: Any](),
		plan: String = "",
		prorate: Bool = false,
		proration_date: Int = 0,
		quantity: Int = 0,
		source: String = "",
		tax_percent: Double = 0.00,
		trial_end: Int = 0

		) throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		var params = [String: Any]()
		if application_fee_percent > 0.00 { params["application_fee_percent"] = application_fee_percent }
		if !coupon.isEmpty { params["coupon"] = coupon }
		if !metadata.isEmpty { params["metadata"] = metadata }
		if !plan.isEmpty { params["plan"] = plan }
		if prorate == true { params["prorate"] = prorate }
		if proration_date > 0 { params["proration_date"] = proration_date }
		if quantity > 0 { params["quantity"] = quantity }
		if !source.isEmpty { params["source"] = source }
		if tax_percent > 0.00 { params["tax_percent"] = tax_percent }
		if trial_end > 0 { params["trial_end"] = trial_end }


		var subItems = [[String:Any]]()
		items.forEach{
			i in
			var x = [String: Any]()
			x["plan"] = i.plan.id
			x["deleted"] = i.deleted
			if i.quantity > 0 { x["quantity"] = i.quantity }
			subItems.append(x)
		}
		if subItems.count > 0 { params["items"] = subItems }

		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/subscriptions/\(id)", params: params)

		if code != 200 {
			print("Subscription.update Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
