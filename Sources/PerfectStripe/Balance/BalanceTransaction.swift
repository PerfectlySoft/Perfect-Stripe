//
//  BalanceTransaction.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

public class StripeBalanceTransaction {

	/// Unique identifier for the object
	public var id				= ""

	/// Gross amount of the transaction, in cents
	public var amount			= 0

	/// Timestamp. The date the transaction’s net funds will become available in the Stripe balance
	public var available_on		= 0

	/// Timestamp. The date the transaction’s net funds will become available in the Stripe balance
	public var created			= 0

	/// Three-letter ISO currency code, in lowercase. Must be a supported currency
	public var currency			= ""

	/// An arbitrary string attached to the object. Often useful for displaying to users
	public var description		= ""

	/// Fees (in cents) paid for this transaction
	public var fee				= 0

	/// Detailed breakdown of fees (in cents) paid for this transaction
	public var fee_details		= [StripeFeeDetail]()

	/// Net amount of the transaction, in cents
	public var net				= 0

	/// The Stripe object this transaction is related to. Expandable
	public var source			= ""

	/// If the transaction’s net funds are available in the Stripe balance yet. Either available or pending
	public var status: StripeTransactionStatus	= .pending

	/// Transaction type: adjustment, application_fee, application_fee_refund, charge, payment, payment_failure_refund, payment_refund, refund, transfer, transfer_cancel, transfer_failure, transfer_refund, or validation
	public var type: StripeTransactionType = .charge





	public func get(_ id: String) {
		let (response, code) = Stripe.makeRequest(.get, "/balance/history/\(id)")

		if code != 200 {
			print("Error: \(code)")
		} else {
			parse(response)
		}
	}

	func parse(_ obj: [String: Any]) {
		if let o = obj["id"], !(o as? String ?? "").isEmpty {
			id = o as? String ?? ""
		}
		if let o = obj["amount"] { amount = o as? Int ?? 0 }
		if let o = obj["available_on"] { available_on = o as? Int ?? 0 }
		if let o = obj["created"] { created = o as? Int ?? 0 }
		if let o = obj["currency"], !(o as? String ?? "").isEmpty { currency = o as? String ?? "" }
		if let o = obj["description"], !(o as? String ?? "").isEmpty { description = o as? String ?? "" }
		if let o = obj["fee"] { fee = o as? Int ?? 0 }
		if let o = obj["fee_details"], o is [[String: Any]] {
			fee_details = StripeFeeDetail.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
		}
		if let o = obj["net"] { net = o as? Int ?? 0 }
		if let o = obj["source"], !(o as? String ?? "").isEmpty { source = o as? String ?? "" }
		if let o = obj["status"], !(o as? String ?? "").isEmpty {
			if o as? String == "pending" { status = .pending } else { status = .available }
		}
		if let o = obj["type"], !(o as? String ?? "").isEmpty {
			type = StripeTransactionType(rawValue: o as? String ?? "") ?? .charge
		}
	}

}


