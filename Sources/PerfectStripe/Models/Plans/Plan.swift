//
//  Plan.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib


extension Stripe {
	/// A subscription plan contains the pricing information for different products and feature levels on your site.
	/// For example, you might have a $100/month plan for basic features and a different $200/month plan for premium features.
	public struct Plan: Codable {

		///	Unique identifier for the object.
		public var id = ""

		///		The amount in cents to be charged on the interval specified.
		public var amount = 0

		///	Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created = 0

		///	Three-letter ISO currency code, in lowercase. Must be a supported currency.
		public var currency  = ""

		///	One of day, week, month or year. The frequency with which a subscription should be billed.
		public var interval: Interval = .month

		///	The number of intervals (specified in the interval property) between each subscription billing. For example, interval=month and interval_count=3 bills every 3 months.
		public var interval_count = 1

		///	Flag indicating whether the object exists in live mode or test mode.
		public var livemode: Bool?

		///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
		public var metadata = [String:String]()

		///	Display name of the plan.
		public var name = ""

		///	Extra information about a charge for the customer’s credit card statement.
		public var statement_descriptor = ""

		///	Number of trial period days granted when subscribing a customer to this plan. Null if the plan has no trial period.
		public var trial_period_days = 0

	}
}
