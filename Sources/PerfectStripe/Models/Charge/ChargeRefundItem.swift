//
//  ChargeRefundItem.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-18.
//
//

import PerfectLib

extension Stripe {
	public struct ChargeRefundItem: Codable {

		/// Unique identifier for the object.
		public var id: String = ""

		/// Amount, in cents.
		public var amount: Int = 0

		/// Balance transaction that describes the impact on your account balance.
		public var balance_transaction: String = ""

		/// ID of the charge that was refunded.
		public var charge: String = ""

		/// Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created: Int = 0

		/// Three-letter ISO currency code, in lowercase. Must be a supported currency.
		public var currency: String = ""

		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String = ""

		/// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
		public var metadata:[String: String]?

		/// Reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer.
		public var reason: ChargeRefundReason = .requested_by_customer

		/// This is the transaction number that appears on email receipts sent for this refund.
		public var receipt_number: String = ""

		/// Status of the refund. For credit card refunds, this will always be succeeded. For other types of refunds, it can be pending, succeeded, failed, or cancelled.
		public var status: ChargeRefundStatus = .succeeded

	}
}


