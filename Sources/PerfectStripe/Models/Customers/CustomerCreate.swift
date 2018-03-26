//
//  CustomerCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-30.
//
//


//extension StripeCustomer {

	/// A coupon has either a percent_off or an amount_off and currency. If you set an amount_off, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of $100 will have a final total of $0 if a coupon with an amount_off of 20000 is applied to it and an invoice with a subtotal of $300 will have a final total of $100 if a coupon with an amount_off of 20000 is applied to it.
//	public func create(
//
//
//		/// The identifier of the customer to subscribe.
//		customer: String,
//
//		/// A non-negative decimal (with at most two decimal places) between 0 and 100. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner’s Stripe account. The request must be made with an OAuth key in order to set an application fee percentage. For more information, see the application fees documentation.
//		application_fee_percent: Double = 0.00,
//
//		/// The code of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription..
//		coupon: String = "",
//
//		/// List of subscription items, each with an attached plan.
//		items: [StripeSubscriptionItem] = [StripeSubscriptionItem](),
//
//		/// A set of key/value pairs that you can attach to a subscription object. It can be useful for storing additional information about the subscription in a structured format. You can unset individual keys if you POST an empty value for that key. You can clear all keys if you POST an empty value for metadata.
//		metadata: [String: Any] = [String: Any](),
//
//		/// The identifier of the plan to subscribe the customer to.
//		plan: String = "",
//
//		/// The quantity you’d like to apply to the subscription you’re creating. For example, if your plan is 10/user/month, and your customer has 5 users, you could pass 5 as the quantity to have the customer charged 50 (5 x 10) monthly. If you update a subscription but don’t change the plan ID (e.g. changing only the trial_end), the subscription will inherit the old subscription’s quantity attribute unless you pass a new quantity parameter. If you update a subscription and change the plan ID, the new subscription will not inherit the quantity attribute and will default to 1 unless you pass a quantity parameter.
//		quantity: Int = 1,
//
//		/// You must provide a source if the customer does not already have a valid source attached, and you are subscribing the customer for a plan that is not free.
//		source: String = "",
//
//		/// A non-negative decimal (with at most four decimal places) between 0 and 100. This represents the percentage of the subscription invoice subtotal that will be calculated and added as tax to the final amount each billing period. For example, a plan which charges $10/month with a tax_percent of 20.0 will charge $12 per invoice.
//		tax_percent: Double = 0.00,
//
//		/// Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value now can be provided to end the customer’s trial immediately.
//		trial_end: Int = 0,
//
//		/// Integer representing the number of trial period days before the customer is charged for the first time. If set, trial_period_days overrides the default trial period days of the plan the customer is being subscribed to.
//		trial_period_days: Int = 0
//
//		){
//
//		// Required fields:
//		// duration
//
//		var params = [String: Any]()
//		params["customer"] = customer
//
//		if application_fee_percent > 0.00 { params["application_fee_percent"] = "\(application_fee_percent)" }
//		if !coupon.isEmpty { params["coupon"] = coupon }
//
//		var subItems = [[String:Any]]()
//		items.forEach{
//			i in
//			var x = [String: Any]()
//			x["plan"] = i.plan.id
//			if i.quantity > 0 { x["quantity"] = i.quantity }
//			subItems.append(x)
//		}
//		if subItems.count > 0 { params["items"] = subItems }
//		if !metadata.isEmpty { params["metadata"] = metadata }
//		if !plan.isEmpty { params["plan"] = plan }
//		if quantity > 0 { params["quantity"] = quantity }
//		if !source.isEmpty { params["source"] = source }
//		if tax_percent > 0.00 { params["tax_percent"] = tax_percent }
//		if trial_end > 0 { params["trial_end"] = trial_end }
//		if trial_period_days > 0 { params["trial_period_days"] = trial_period_days }
//
//
//
//
//		// execute request
//		let (response, code) = Stripe.makeRequest(.post, "/subscriptions", params: params)
//
//		if code != 200 {
//			print("Subscription.create Error: \(StripeHTTPErrorCode.fromCode(code))")
//		} else {
//			parse(response)
//		}
//		
//	}
//}

