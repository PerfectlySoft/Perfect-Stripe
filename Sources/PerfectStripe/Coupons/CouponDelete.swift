//
//  CouponDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeCoupon {

	/// You can delete coupons via the coupon management page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.
	public func delete() throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		// execute request
		let (response, code) = Stripe.makeRequest(.delete, "/coupons/\(id)")

		if code != 200 {
			print("Coupon.delete Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
