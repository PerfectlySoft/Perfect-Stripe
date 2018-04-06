//
//  Address.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {

	/// Information about the owner of the payment instrument that may be used or required by particular source types
	public struct GenericAddress: Codable {

		/// City/District/Suburb/Town/Village.
		public var city: String?

		/// 2-letter country code
		public var country: String?

		/// Address line 1 (Street address/PO Box/Company name)
		public var line1: String?

		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var line2: String?

		/// ZIP or postal code
		public var postal_code: String?

		/// State/County/Province/Region
		public var state: String?

	}
}
