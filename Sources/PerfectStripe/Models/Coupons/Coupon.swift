//
//  Coupon.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

extension Stripe {
	///	A coupon contains information about a percent-off or amount-off discount you might want to apply to a customer. Coupons may be applied to invoices or orders. Coupons do not work with conventional one-off charges, but you can implement a custom coupon system in your application.
	public struct Coupon: Codable {

		/// Unique identifier for the object.
		public var id: String?

		///	Amount (in the currency specified) that will be taken off the subtotal of any invoices for this customer.
		public var amount_off: Int?

		///	Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created: Int?

		/// If amount_off has been set, the three-letter ISO code for the currency of the amount to take off.
		public var currency: String?

		/// One of forever, once, and repeating. Describes how long a customer who applies this coupon will get the discount.
		public var duration: CouponDuration = .once

		///	If duration is repeating, the number of months the coupon applies. Null if coupon duration is forever or once.
		public var duration_in_months: Int?

		///	Flag indicating whether the object exists in live mode or test mode.
		public var livemode: Bool?

		///	Maximum number of times this coupon can be redeemed, in total, before it is no longer valid.
		public var max_redemptions: Int?

		///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
		public var metadata: [String:String]?

		///	Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a $100 invoice $50 instead.
		public var percent_off: Int?

		///	Date after which the coupon can no longer be redeemed.
		public var redeem_by: Int?

		///	Number of times this coupon has been applied to a customer.
		public var times_redeemed: Int?

		///	Taking account of the above properties, whether this coupon can still be applied to a customer.
		public var valid: Bool?
	}
}
