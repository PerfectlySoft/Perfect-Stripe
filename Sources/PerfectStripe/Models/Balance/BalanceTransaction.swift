//
//  BalanceTransaction.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

extension Stripe {
	public struct BalanceTransaction: Codable {

		/// Unique identifier for the object
		public var id:				String

		/// Gross amount of the transaction, in cents
		public var amount:			Int

		/// Timestamp. The date the transaction’s net funds will become available in the Stripe balance
		public var available_on:	Int

		/// Timestamp. The date the transaction’s net funds will become available in the Stripe balance
		public var created:			Int

		/// Three-letter ISO currency code, in lowercase. Must be a supported currency
		public var currency:		String

		/// An arbitrary string attached to the object. Often useful for displaying to users
		public var description:		String?

		/// Fees (in cents) paid for this transaction
		public var fee:				Int

		/// Detailed breakdown of fees (in cents) paid for this transaction
		public var fee_details:		[FeeDetail]?

		/// Net amount of the transaction, in cents
		public var net:				Int

		/// The Stripe object this transaction is related to. Expandable
		public var source:			String

		/// If the transaction’s net funds are available in the Stripe balance yet. Either available or pending
		public var status: 			Stripe.TransactionStatus	= .pending

		/// Transaction type: adjustment, application_fee, application_fee_refund, charge, payment, payment_failure_refund, payment_refund, refund, transfer, transfer_cancel, transfer_failure, transfer_refund, or validation
		public var type: 			Stripe.TransactionType = .charge

	}
}
