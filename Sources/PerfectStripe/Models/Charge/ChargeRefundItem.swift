//
//  ChargeRefundItem.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-18.
//
//

import PerfectLib

public class StripeChargeRefundItem {

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
	public var metadata:[String: Any] = [String: Any]()

	/// Reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer.
	public var reason: StripeChargeRefundReason = .requested_by_customer

	/// This is the transaction number that appears on email receipts sent for this refund.
	public var receipt_number: String = ""

	/// Status of the refund. For credit card refunds, this will always be succeeded. For other types of refunds, it can be pending, succeeded, failed, or cancelled.
	public var status: StripeChargeRefundStatus = .succeeded


//	static func parseArray(_ o: [[String: Any]]) -> [StripeChargeRefundItem] {
//		var out = [StripeChargeRefundItem]()
//		o.forEach{
//			data in
//			let this = StripeChargeRefundItem()
//			this.parse(data)
//			out.append(this)
//		}
//		return out
//	}
//
//
//	func parse(_ obj: [String: Any]) {
//
//		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
//			id = o as? String ?? ""
//		}
//		if let o = obj["amount"], o is Int {
//			amount = o as? Int ?? 0
//		}
//		if let o = obj["balance_transaction"], !(o is PerfectLib.JSONConvertibleNull) {
//			balance_transaction = o as? String ?? ""
//		}
//		if let o = obj["charge"], !(o is PerfectLib.JSONConvertibleNull) {
//			charge = o as? String ?? ""
//		}
//		if let o = obj["created"], o is Int {
//			created = o as? Int ?? 0
//		}
//		if let o = obj["currency"], !(o is PerfectLib.JSONConvertibleNull) {
//			currency = o as? String ?? ""
//		}
//		if let o = obj["description"], !(o is PerfectLib.JSONConvertibleNull) {
//			description = o as? String ?? ""
//		}
//		if let o = obj["metadata"], o is [String: Any] {
//			metadata = o as? [String: Any] ?? [String: Any]()
//		}
//		if let o = obj["status"], !(o as? String ?? "").isEmpty {
//			reason = StripeChargeRefundReason(rawValue: o as? String ?? "") ?? .requested_by_customer
//		}
//		if let o = obj["receipt_number"], !(o is PerfectLib.JSONConvertibleNull) {
//			receipt_number = o as? String ?? ""
//		}
//		if let o = obj["status"], !(o as? String ?? "").isEmpty {
//			status = StripeChargeRefundStatus(rawValue: o as? String ?? "") ?? .succeeded
//		}
//
//	}

}



