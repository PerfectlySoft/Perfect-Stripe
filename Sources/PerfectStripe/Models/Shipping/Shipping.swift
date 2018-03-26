//
//  Shipping.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

extension Stripe {
	public struct Shipping: Codable {

		/// Shipping address
		public var address: ShippingAddress?

		/// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
		public var carrier = ""

		/// Recipient name.
		public var name = ""

		/// Recipient phone (including extension).
		public var phone = ""

		/// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
		public var tracking_number = ""
	}
}
