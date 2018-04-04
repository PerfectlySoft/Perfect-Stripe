//
//  ShippingAddress.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

import PerfectLib

extension Stripe {
	public struct ShippingAddress: Codable {

		/// City/District/Suburb/Town/Village
		public var city: String?

		/// 2-letter country code
		public var country: String?

		/// Address line 1 (Street address/PO Box/Company name).
		public var line1: String?

		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var line2: String?

		/// Zip/Postal Code.
		public var postal_code: String?

		/// State/County/Province/Region.
		public var state: String?
	}
}
