//
//  ChargeDestination.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

extension Stripe {
	public class ChargeDestination: Codable {
		// Used only for "Connect" Feature

		///  ID of an existing, connected stripe account
		public var account: String = ""

		/// The amount to transfer to the destination account without creating an Application Fee. Cannot be combined with the application_fee parameter. Must be equal to or lesser than the charge amount
		public var amount: Int = 0
	}
}
