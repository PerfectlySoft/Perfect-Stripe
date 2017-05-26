//
//  PlanCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripePlan {

	public func create(

		/// Unique string of your choice that will be used to identify this plan when subscribing a customer. This could be an identifier like “gold” or a primary key from your own database
		id: String,

		/// A positive integer in cents (or 0 for a free plan) representing how much to charge (on a recurring basis).
		amount: Int,

		/// Three-letter ISO currency code, in lowercase. Must be a supported currency.
		currency: String,

		/// Specifies billing frequency. Either day, week, month or year.
		interval: StripeInterval,

		/// Name of the plan, to be displayed on invoices and in the web interface
		name: String,

		/// The number of intervals between each subscription billing. For example, interval=month and interval_count=3 bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).
		interval_count: Int = 1,

		/// A set of key/value pairs that you can attach to a plan object. It can be useful for storing additional information about the plan in a structured format.
		metadata: [String: Any] = [String: Any](),

		/// An arbitrary string to be displayed on your customer’s credit card statement. This may be up to 22 characters. As an example, if your website is RunClub and the item you’re charging for is your Silver Plan, you may want to specify a statement_descriptor of RunClub Silver Plan. The statement description may not include <>"' characters, and will appear on your customer’s statement in capital letters. Non-ASCII characters are automatically stripped. While most banks display this information consistently, some may display it incorrectly or not at all.
		statement_descriptor: String = "",

		/// Specifies a trial period in (an integer number of) days. If you include a trial period, the customer won’t be billed for the first time until the trial period ends. If the customer cancels before the trial period is over, she’ll never be billed at all.
		trial_period_days: Int = 0
		){

		// Required fields:
		// id, amount, currency, interval, name

		var params = [String: Any]()
		params["id"] = id
		params["amount"] = amount
		params["currency"] = currency
		params["interval"] = interval.rawValue
		params["name"] = name

		if interval_count > 0 { params["interval_count"] = "\(interval_count)" }
		if !metadata.isEmpty { params["metadata"] = metadata }
		if !statement_descriptor.isEmpty { params["statement_descriptor"] = statement_descriptor }
		if trial_period_days > 0 { params["trial_period_days"] = "\(trial_period_days)" }


		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/plans", params: params)

		if code != 200 {
			print("StripeCharge.create Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
		
	}
}
