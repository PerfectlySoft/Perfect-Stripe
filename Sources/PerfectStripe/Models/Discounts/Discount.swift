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
	public struct Discount: Codable {

		/// Hash describing the coupon applied to create this discount.
		public var coupon: Coupon = Coupon()

		/// Customer id
		public var customer = ""

		///	If the coupon has a duration of once or repeating, the date that this discount will end. If the coupon used has a forever duration, this attribute will be null.
		public var end = 0

		///	Date that the coupon was applied..
		public var start = 0

		///	The subscription that this coupon is applied to, if it is applied to a particular subscription.
		public var subscription = ""
	}
}
