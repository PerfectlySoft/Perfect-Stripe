//
//  Shipping.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

public class StripeChargeShipping {

	/// Shipping address
	public var address: StripeChargeShippingAddress = StripeChargeShippingAddress()

	/// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
	public var carrier = ""

	/// Recipient name.
	public var name = ""

	/// Recipient phone (including extension).
	public var phone = ""

	/// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
	public var tracking_number = ""




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


public class StripeChargeShippingAddress {

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
