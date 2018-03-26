//
//  SubscriptionItem.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

extension Stripe {
	///	Subscription items allow you to create customer subscriptions with more than one plan,
	/// making it easy to represent complex billing relationships.
	public class SubscriptionItem: Codable {

		/// Unique identifier for the object.
		public var id = ""

		///	Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created = 0

		///	Hash describing the plan the customer is subscribed to.
		public var plan: Plan = Plan()

		///	The quantity of the plan to which the customer should be subscribed.
		public var quantity = 0

		///	Only used for setting to true when performing a subscription update. Not stored or acted on on the Stripe item object
		public var deleted = false

	}
}
