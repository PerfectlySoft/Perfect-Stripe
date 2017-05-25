//
//  FeeDetail.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

public class StripeFeeDetail {
	/// Amount of the fee, in cents
	public var amount			= 0

	/// application
	public var application		= ""

	/// Three-letter ISO currency code, in lowercase. Must be a supported currency
	public var currency			= ""

	/// An arbitrary string attached to the object. Often useful for displaying to users
	public var description		= ""

	/// Type of the fee, one of: application_fee, stripe_fee or tax
	public var type: StripeFeeType	= .stripe_fee



	static func parseArray(_ o: [[String: Any]]) -> [StripeFeeDetail] {
		var out = [StripeFeeDetail]()

		o.forEach{
			data in
			let this = StripeFeeDetail()
			if let item = data["amount"] { this.amount = item as? Int ?? 0 }
			if let item = data["application"] { this.application = item as? String ?? "" }
			if let item = data["currency"] { this.currency = item as? String ?? "" }
			if let item = data["description"] { this.description = item as? String ?? "" }
			if let item = data["type"], !(item as? String ?? "").isEmpty {
				this.type = StripeFeeType(rawValue: item as? String ?? "") ?? .stripe_fee
			}
			out.append(this)
		}
		return out
	}

}
