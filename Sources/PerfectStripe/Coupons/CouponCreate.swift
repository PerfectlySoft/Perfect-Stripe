//
//  CouponCreate.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeCoupon {

	/// A coupon has either a percent_off or an amount_off and currency. If you set an amount_off, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of $100 will have a final total of $0 if a coupon with an amount_off of 20000 is applied to it and an invoice with a subtotal of $300 will have a final total of $100 if a coupon with an amount_off of 20000 is applied to it.
	public func create(

		/// Specifies how long the discount will be in effect. Can be forever, once, or repeating.
		duration: StripeCouponDuration,

		/// Unique string of your choice that will be used to identify this coupon when applying it to a customer. This is often a specific code you’ll give to your customer to use when signing up (e.g. FALL25OFF). If you don’t want to specify a particular code, you can leave the ID blank and we’ll generate a random code for you.
		id: String = "",

		/// A positive integer representing the amount to subtract from an invoice total (required if percent_off is not passed).
		amount_off: Int = 0,

		/// Three-letter ISO code for the currency of the amount_off parameter (required if amount_off is passed).
		currency: String = "",

		/// Required only if duration is repeating, in which case it must be a positive integer that specifies the number of months the discount will be in effect.
		duration_in_months: Int = 0,

		/// A positive integer specifying the number of times the coupon can be redeemed before it’s no longer valid. For example, you might have a 50% off coupon that the first 20 readers of your blog can use.
		max_redemptions: Int = 0,

		/// A set of key/value pairs that you can attach to a coupon object. It can be useful for storing additional information about the coupon in a structured format.
		metadata: [String: Any] = [String: Any](),

		/// A positive integer between 1 and 100 that represents the discount the coupon will apply (required if amount_off is not passed).
		percent_off: Int = 0,

		/// Unix timestamp specifying the last time at which the coupon can be redeemed. After the redeem_by date, the coupon can no longer be applied to new customers.
		redeem_by: Int = 0
		){

		// Required fields:
		// duration

		var params = [String: Any]()
		params["duration"] = duration

		if !id.isEmpty { params["id"] = id }
		if amount_off > 0 { params["amount_off"] = "\(amount_off)" }
		if !currency.isEmpty { params["currency"] = currency }
		if duration_in_months > 0 { params["duration_in_months"] = "\(duration_in_months)" }
		if max_redemptions > 0 { params["max_redemptions"] = "\(max_redemptions)" }
		if !metadata.isEmpty { params["metadata"] = metadata }
		if percent_off > 0 { params["percent_off"] = "\(percent_off)" }
		if redeem_by > 0 { params["redeem_by"] = "\(redeem_by)" }


		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/coupons", params: params)

		if code != 200 {
			print("Coupon.create Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
		
	}
}
