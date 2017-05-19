//
//  Refund.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

public class StripeChargeRefund {

	/// Array of refunds
	public var data: [StripeChargeRefundItem] = [StripeChargeRefundItem]()

	/// True if this list has another page of items after this one that can be fetched
	public var has_more: Bool	= false

	/// The total number of items available. This value is not included by default, but you can request it by specifying ?include[]=total_count
	public var total_count: Int = 0

	/// The URL where this list can be accessed
	public var url: String = ""


	func parse(_ obj: [String: Any]) {

		if let o = obj["data"], o is [[String: Any]] {
			data = StripeChargeRefundItem.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
		}
		if let o = obj["has_more"], o is Bool {
			has_more = o as? Bool ?? false
		}
		if let o = obj["total_count"], o is Int {
			total_count = o as? Int ?? 0
		}
		if let o = obj["url"], !(o is PerfectLib.JSONConvertibleNull) {
			url = o as? String ?? ""
		}
	}

}




