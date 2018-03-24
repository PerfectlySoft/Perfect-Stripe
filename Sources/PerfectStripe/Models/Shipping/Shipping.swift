//
//  Shipping.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

public class StripeShipping {

	/// Shipping address
	public var address: StripeShippingAddress = StripeShippingAddress()

	/// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
	public var carrier = ""

	/// Recipient name.
	public var name = ""

	/// Recipient phone (including extension).
	public var phone = ""

	/// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
	public var tracking_number = ""


	func parse(_ obj: [String: Any]) {

		if let o = obj["address"], o is [String: Any] {
			address.parse(o as? [String: Any] ?? [String: Any]())
		}
		if let o = obj["carrier"], !(o is PerfectLib.JSONConvertibleNull) {
			carrier = o as? String ?? ""
		}
		if let o = obj["name"], !(o is PerfectLib.JSONConvertibleNull) {
			name = o as? String ?? ""
		}
		if let o = obj["phone"], !(o is PerfectLib.JSONConvertibleNull) {
			phone = o as? String ?? ""
		}
		if let o = obj["tracking_number"], !(o is PerfectLib.JSONConvertibleNull) {
			tracking_number = o as? String ?? ""
		}
	}


	public func asData() -> [String: Any] {
		var d = [String: Any]()
		d["carrier"] = carrier
		d["name"] = name
		d["phone"] = phone
		d["tracking_number"] = tracking_number
		d["address"] = address.asData()
		return d
	}
}


