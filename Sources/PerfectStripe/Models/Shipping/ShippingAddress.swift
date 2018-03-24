//
//  ShippingAddress.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

import PerfectLib

public class StripeShippingAddress {

	/// City/District/Suburb/Town/Village
	public var city: String = ""

	/// 2-letter country code
	public var country: String = ""

	/// Address line 1 (Street address/PO Box/Company name).
	public var line1: String = ""

	/// Address line 2 (Apartment/Suite/Unit/Building).
	public var line2: String = ""

	/// Zip/Postal Code.
	public var postal_code: String = ""

	/// State/County/Province/Region.
	public var state: String = ""



	func parse(_ obj: [String: Any]) {

		if let o = obj["city"], !(o is PerfectLib.JSONConvertibleNull) {
			city = o as? String ?? ""
		}
		if let o = obj["country"], !(o is PerfectLib.JSONConvertibleNull) {
			country = o as? String ?? ""
		}
		if let o = obj["line1"], !(o is PerfectLib.JSONConvertibleNull) {
			line1 = o as? String ?? ""
		}
		if let o = obj["line2"], !(o is PerfectLib.JSONConvertibleNull) {
			line2 = o as? String ?? ""
		}
		if let o = obj["postal_code"], !(o is PerfectLib.JSONConvertibleNull) {
			postal_code = o as? String ?? ""
		}
		if let o = obj["state"], !(o is PerfectLib.JSONConvertibleNull) {
			state = o as? String ?? ""
		}
	}



	public func asData() -> [String: Any] {
		var d = [String: Any]()
		d["city"] = city
		d["country"] = country
		d["line1"] = line1
		d["line2"] = line2
		d["postal_code"] = postal_code
		d["state"] = state
		return d
	}
	
}
