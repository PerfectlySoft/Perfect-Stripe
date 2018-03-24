//
//  Plan.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

/// A subscription plan contains the pricing information for different products and feature levels on your site. 
/// For example, you might have a $100/month plan for basic features and a different $200/month plan for premium features.
public class StripePlan {

	///	Unique identifier for the object.
	public var id = ""

	///		The amount in cents to be charged on the interval specified.
	public var amount = 0

	///	Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created = 0

	///	Three-letter ISO currency code, in lowercase. Must be a supported currency.
	public var currency  = ""

	///	One of day, week, month or year. The frequency with which a subscription should be billed.
	public var interval: StripeInterval = .month

	///	The number of intervals (specified in the interval property) between each subscription billing. For example, interval=month and interval_count=3 bills every 3 months.
	public var interval_count = 1

	///	Flag indicating whether the object exists in live mode or test mode.
	public var livemode = false

	///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata = [String:Any]()

	///	Display name of the plan.
	public var name = ""

	///	Extra information about a charge for the customer’s credit card statement.
	public var statement_descriptor = ""

	///	Number of trial period days granted when subscribing a customer to this plan. Null if the plan has no trial period.
	public var trial_period_days = 0



	func parse(_ obj: [String: Any]) {

		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
			id = o as? String ?? ""
		}
		if let o = obj["amount"], o is Int {
			amount = o as? Int ?? 0
		}
		if let o = obj["created"], o is Int {
			created = o as? Int ?? 0
		}
		if let o = obj["currency"], !(o is PerfectLib.JSONConvertibleNull) {
			currency = o as? String ?? ""
		}
		if let o = obj["interval"], !(o as? String ?? "").isEmpty {
			interval = StripeInterval(rawValue: o as? String ?? "") ?? .month
		}
		if let o = obj["interval_count"], o is Int {
			interval_count = o as? Int ?? 1
		}
		if let o = obj["livemode"], o is Bool {
			livemode = o as? Bool ?? false
		}
		if let o = obj["metadata"], o is [String: Any] {
			metadata = o as? [String: Any] ?? [String: Any]()
		}
		if let o = obj["name"], !(o is PerfectLib.JSONConvertibleNull) {
			name = o as? String ?? ""
		}
		if let o = obj["statement_descriptor"], !(o is PerfectLib.JSONConvertibleNull) {
			statement_descriptor = o as? String ?? ""
		}
		if let o = obj["trial_period_days"], o is Int {
			trial_period_days = o as? Int ?? 0
		}

	}


	func parseArray(_ o: [[String: Any]]) -> [StripePlan] {
		var out = [StripePlan]()
		o.forEach{
			data in
			let this = StripePlan()
			this.parse(data)
			out.append(this)
		}
		return out
	}

}
