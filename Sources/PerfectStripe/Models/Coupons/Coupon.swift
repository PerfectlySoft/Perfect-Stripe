//
//  Coupon.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

///	A coupon contains information about a percent-off or amount-off discount you might want to apply to a customer. Coupons may be applied to invoices or orders. Coupons do not work with conventional one-off charges, but you can implement a custom coupon system in your application.
public class StripeCoupon {

	/// Unique identifier for the object.
	public var id = ""

	///	Amount (in the currency specified) that will be taken off the subtotal of any invoices for this customer.
	public var amount_off = 0

	///	Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created = 0

	/// If amount_off has been set, the three-letter ISO code for the currency of the amount to take off.
	public var currency = ""

	/// One of forever, once, and repeating. Describes how long a customer who applies this coupon will get the discount.
	public var duration: StripeCouponDuration = .once

	///	If duration is repeating, the number of months the coupon applies. Null if coupon duration is forever or once.
	public var duration_in_months = 0

	///	Flag indicating whether the object exists in live mode or test mode.
	public var livemode = false

	///	Maximum number of times this coupon can be redeemed, in total, before it is no longer valid.
	public var max_redemptions = 0

	///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata = [String:Any]()

	///	Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a $100 invoice $50 instead.
	public var percent_off = 0

	///	Date after which the coupon can no longer be redeemed.
	public var redeem_by = 0

	///	Number of times this coupon has been applied to a customer.
	public var times_redeemed = 0

	///	Taking account of the above properties, whether this coupon can still be applied to a customer.
	public var valid = true




	func parse(_ obj: [String: Any]) {

		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
			id = o as? String ?? ""
		}
		if let o = obj["amount_off"], o is Int {
			amount_off = o as? Int ?? 0
		}
		if let o = obj["created"], o is Int {
			created = o as? Int ?? 0
		}
		if let o = obj["currency"], !(o is PerfectLib.JSONConvertibleNull) {
			currency = o as? String ?? ""
		}
		if let o = obj["duration"], !(o as? String ?? "").isEmpty {
			duration = StripeCouponDuration(rawValue: o as? String ?? "") ?? .once
		}
		if let o = obj["duration_in_months"], o is Int {
			duration_in_months = o as? Int ?? 0
		}
		if let o = obj["livemode"], o is Bool {
			livemode = o as? Bool ?? false
		}
		if let o = obj["max_redemptions"], o is Int {
			max_redemptions = o as? Int ?? 0
		}
		if let o = obj["metadata"], o is [String: Any] {
			metadata = o as? [String: Any] ?? [String: Any]()
		}
		if let o = obj["percent_off"], o is Int {
			percent_off = o as? Int ?? 0
		}
		if let o = obj["redeem_by"], o is Int {
			redeem_by = o as? Int ?? 0
		}
		if let o = obj["times_redeemed"], o is Int {
			times_redeemed = o as? Int ?? 0
		}
		if let o = obj["valid"], o is Bool {
			valid = o as? Bool ?? false
		}


	}


	func parseArray(_ o: [[String: Any]]) -> [StripeCoupon] {
		var out = [StripeCoupon]()
		o.forEach{
			data in
			let this = StripeCoupon()
			this.parse(data)
			out.append(this)
		}
		return out
	}
}
