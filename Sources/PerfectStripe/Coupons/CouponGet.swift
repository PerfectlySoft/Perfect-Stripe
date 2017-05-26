//
//  CouponGet.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeCoupon {
	
	/// Retrieves the invoice item with the given ID.
	public func get(_ id: String) {
		
		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/coupons/\(id)")

		if code != 200 {
			print("Coupon.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
