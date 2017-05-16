//
//  Charge.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-12.
//
//

/// To charge a credit or a debit card, you create a charge object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique random ID.
public class StripeCharge {
	/// Unique identifier for the object
	public var id					= ""

	/// A positive integer in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a 0-decimal currency) representing how much to charge. The minimum amount is $0.50 US or equivalent in charge currency.
	public var amount				= 0

	/// Amount in cents refunded (can be less than the amount attribute on the charge if a partial refund was issued).
	public var amount_refunded		= 0

	/// ID of the Connect application that created the charge
	public var application			= ""

	/// The application fee (if any) for the charge. See the Connect documentation for details
	public var application_fee		= ""

	/// ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
	public var balance_transaction	= ""

	/// If the charge was created without capturing, this boolean represents whether or not it is still uncaptured or has since been captured
	public var captured				= false

	/// Time at which the object was created. Measured in seconds since the Unix epoch
	public var created				= 0

	/// Three-letter ISO currency code, in lowercase. Must be a supported currency
	public var currency				= ""

	/// ID of the customer this charge is for if one exists.
	public var customer				= ""

	/// An arbitrary string attached to the object. Often useful for displaying to users
	public var description			= ""

	/// The account (if any) the charge was made on behalf of, with an automatic transfer. See the Connect documentation for details
	public var destination			= ""

	/// Details about the dispute if the charge has been disputed
	public var dispute				= ""

	/// Error code explaining reason for charge failure if available (see the errors section for a list of codes).
	public var failure_code: StripeErrorCode			= .none

	/// Message to user further explaining reason for charge failure if available.
	public var failure_message		= ""

	/// Hash with information on fraud assessments for the charge. Assessments reported by you have the key user_report and, if set, possible values of safe and fraudulent. Assessments from Stripe have the key stripe_report and, if set, the value fraudulent.
	public var fraud_details		= ""

	/// ID of the invoice this charge is for if one exists.
	public var invoice				= ""

	/// Flag indicating whether the object exists in live mode or test mode.
	public var livemode				= false

	/// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata				= [String: Any]()

	/// The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the Connect documentation for details.
	public var on_behalf_of			= ""

	/// ID of the order this charge is for if one exists.
	public var order				= ""

	/// Details about whether or not the payment was accepted, and why. See understanding declines for details.
	public var outcome				= StripeChargeOutcome()









	// Simple Balance fetch
	public func get() {
		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/balance")

		if code != 200 {
			print("Error: \(code)")
		} else {
			parse(response)
		}
	}

//	public func history(limit: Int = 10, currency: String = "", type: StripeTransactionType = .none) throws -> [StripeBalance] {
//		// make params
//		var params = [String]()
//		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }
//		if !currency.isEmpty { params.append("currency=\(currency)") }
//		if type != .none { params.append("type=\(type.rawValue)") }
//
//		// execute request
//		let (response, code) = Stripe.makeRequest(.get, "/balance/history?\(params.joined(separator: "&"))")
//
//		if code != 200 {
//			print("Error: \(code)")
//			throw StripeError.init(code: .badRequest)
//		} else {
//			if let o = response["data"], o is [[String: Any]] {
//				let history = parseArray(o as? [[String: Any]] ?? [[String: Any]]())
//				return history
//			} else {
//				//				throw StripeError.init(code: .notFound)
//				return [StripeBalance]() // empty array
//			}
//		}
//	}

	func parseArray(_ o: [[String: Any]]) -> [StripeCharge] {
		var out = [StripeCharge]()
		o.forEach{
			data in
			let this = StripeCharge()
			this.parse(data)
			out.append(this)
		}
		return out
	}


	func parse(_ obj: [String: Any]) {
//		if let o = obj["livemode"] {
//			if o as? Bool == true { livemode = true }
//		}
//		if let o = obj["available"], o is [[String: Any]] {
//			available = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
//		}
//		if let o = obj["connect_reserved"], o is [[String: Any]] {
//			connect_reserved = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
//		}
//		if let o = obj["pending"], o is [[String: Any]] {
//			pending = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
//		}
	}
}




