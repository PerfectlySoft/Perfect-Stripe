//
//  FeeDetail.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

extension Stripe {
	public struct FeeDetail: Codable {
		/// Amount of the fee, in cents
		public var amount: Int?

		/// application
		public var application: String?

		/// Three-letter ISO currency code, in lowercase. Must be a supported currency
		public var currency: String?

		/// An arbitrary string attached to the object. Often useful for displaying to users
		public var description: String?

		/// Type of the fee, one of: application_fee, stripe_fee or tax
		public var type: Stripe.FeeType	= .stripe_fee
	}
}
