//
//  SubscriptionItem.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

///	Subscription items allow you to create customer subscriptions with more than one plan, 
/// making it easy to represent complex billing relationships.
public class StripeDiscount {

	/// Hash describing the coupon applied to create this discount.
	public var coupon: StripeCoupon = StripeCoupon()

	/// Customer id
	public var customer = ""

	///	If the coupon has a duration of once or repeating, the date that this discount will end. If the coupon used has a forever duration, this attribute will be null.
	public var end = 0

	///	Date that the coupon was applied..
	public var start = 0

	///	The subscription that this coupon is applied to, if it is applied to a particular subscription.
	public var subscription = ""




	func parse(_ obj: [String: Any]) {

		if let o = obj["coupon"], !(o is PerfectLib.JSONConvertibleNull) {
			coupon.parse(o as? [String:Any] ?? [String:Any]())
		}
		if let o = obj["customer"], !(o is PerfectLib.JSONConvertibleNull) {
			customer = o as? String ?? ""
		}
		if let o = obj["end"], o is Int {
			end = o as? Int ?? 0
		}
		if let o = obj["start"], o is Int {
			start = o as? Int ?? 0
		}
		if let o = obj["subscription"], !(o is PerfectLib.JSONConvertibleNull) {
			subscription = o as? String ?? ""
		}

	}


	func parseArray(_ o: [[String: Any]]) -> [StripeDiscount] {
		var out = [StripeDiscount]()
		o.forEach{
			data in
			let this = StripeDiscount()
			this.parse(data)
			out.append(this)
		}
		return out
	}
}
