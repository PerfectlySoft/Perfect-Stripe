//
//  SourceReceiver.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {

	/// Information related to the receiver flow. Present if the source is a receiver (flow is receiver).
	public struct SourceReceiver: Codable {

		/// The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
		public var address: String?

		/// The total amount that was charged by you. The amount charged is expressed in the source’s currency.
		public var amount_charged: Int?

		/// The total amount received by the receiver source. amount_received = amount_returned + amount_charged is true at all time. The amount received is expressed in the source’s currency.
		public var amount_received: Int?

		/// The total amount that was returned to the customer. The amount returned is expressed in the source’s currency.
		public var amount_returned: Int?

	}
}
