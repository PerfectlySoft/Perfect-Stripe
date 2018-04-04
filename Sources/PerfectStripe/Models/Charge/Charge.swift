//
//  Charge.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-12.
//
//

import PerfectLib

extension Stripe {
/// To charge a credit or a debit card, you create a charge object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique random ID.
	public struct Charge: Codable {

		/// Unique identifier for the object
		public var id: String?

		/// A positive integer in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a 0-decimal currency) representing how much to charge. The minimum amount is $0.50 US or equivalent in charge currency.
		public var amount: Int?

		/// Amount in cents refunded (can be less than the amount attribute on the charge if a partial refund was issued).
		public var amount_refunded: Int?

		/// ID of the Connect application that created the charge
		public var application: String?

		/// The application fee (if any) for the charge. See the Connect documentation for details
		public var application_fee: Int?

		/// ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
		public var balance_transaction: String?

		/// If the charge was created without capturing, this boolean represents whether or not it is still uncaptured or has since been captured
		public var captured: Bool?

		/// Time at which the object was created. Measured in seconds since the Unix epoch
		public var created: Int?

		/// Three-letter ISO currency code, in lowercase. Must be a supported currency
		public var currency: String?

		/// ID of the customer this charge is for if one exists.
		public var customer: String?

		/// An arbitrary string attached to the object. Often useful for displaying to users
		public var description: String?

		/// The account (if any) the charge was made on behalf of, with an automatic transfer. See the Connect documentation for details
		public var destination: ChargeDestination?

		/// Details about the dispute if the charge has been disputed
		public var dispute: String?

		/// Error code explaining reason for charge failure if available (see the errors section for a list of codes).
		public var failure_code: ErrorCode?

		/// Message to user further explaining reason for charge failure if available.
		public var failure_message: String?

		/// Hash with information on fraud assessments for the charge. Assessments reported by you have the key user_report and, if set, possible values of safe and fraudulent. Assessments from Stripe have the key stripe_report and, if set, the value fraudulent.
		public var fraud_details: [String: String]?

		/// ID of the invoice this charge is for if one exists.
		public var invoice: String?

		/// Flag indicating whether the object exists in live mode or test mode.
		public var livemode: Bool?

		/// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
		public var metadata: [String: String]?

		/// The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the Connect documentation for details.
		public var on_behalf_of: String?

		/// ID of the order this charge is for if one exists.
		public var order: String?

		/// Details about whether or not the payment was accepted, and why. See understanding declines for details.
		public var outcome: ChargeOutcome?

		/// true if the charge succeeded, or was successfully authorized for later capture.
		public var paid: Bool?

		/// This is the email address that the receipt for this charge was sent to.
		public var receipt_email: String?

		/// This is the transaction number that appears on email receipts sent for this charge.
		public var receipt_number: String?

		/// Whether or not the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
		public var refunded: Bool?

		/// A list of refunds that have been applied to the charge.
		public var refunds: ChargeRefund?

		/// ID of the review associated with this charge if one exists.
		public var review: String?

		/// Shipping information for the charge.
		public var shipping: Shipping?

		/// For most Stripe users, the source of every charge is a credit or debit card. This hash is then the card object describing that card.
		public var source: Source?

		/// The transfer ID which created this charge. Only present if the charge came from another Stripe account. See the Connect documentation for details.
		public var source_transfer: String?

		/// Extra information about a charge. This will appear on your customer’s credit card statement.
		public var statement_descriptor: String?

		/// The status of the payment is either succeeded, pending, or failed.
		public var status: ChargeStatus?

		/// ID of the transfer to the destination account (only applicable if the charge was created using the destination parameter).
		public var transfer: String?

		/// A string that identifies this transaction as part of a group. See the Connect documentation for details.
		public var transfer_group: String?


	}
}
