//
//  SubscriptionItemCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeSubscriptionItem {

	public func create(

		/// The identifier of the plan to add to the subscription.
		plan: String,

		/// The identifier of the subscription to modify.
		subscription: String,

		/// Flag indicating whether to prorate switching plans during a billing cycle.
		prorate: Bool = false,

		/// If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the upcoming invoice endpoint.
		proration_date: Int,

		/// The quantity you’d like to apply to the subscription item you’re creating.
		quantity: Int = 0
		){

		// Required fields:
		// plan, subscription

		var params = [String: Any]()
		params["plan"] = plan
		params["subscription"] = subscription


		if prorate == true { params["prorate"] = prorate }
		if proration_date > 0 { params["proration_date"] = "\(proration_date)" }
		if quantity > 0 { params["quantity"] = "\(quantity)" }


		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/subscription_items", params: params)

		if code != 200 {
			print("StripeSubscriptionItem.create Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
		
	}
}
