//
//  SourceOwner.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {

	/// Information about the owner of the payment instrument that may be used or required by particular source types
	public struct SourceOwner: Codable {

		/// Owner’s address.
		public var address: GenericAddress?

		/// Owner’s email address.
		public var email: String?

		/// Owner’s full name.
		public var name: String?

		/// Owner’s phone number (including extension).
		public var phone: String?

		/// Verified owner’s address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated..
		public var verified_address: GenericAddress?

		/// Verified owner’s email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
		public var verified_email: String?

		/// Verified owner’s full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
		public var verified_name: String?

		/// Verified owner’s phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
		public var verified_phone: String?

	}
}
