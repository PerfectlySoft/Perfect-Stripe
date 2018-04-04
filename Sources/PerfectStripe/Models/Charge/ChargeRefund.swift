//
//  Refund.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

extension Stripe {
	public struct ChargeRefund: Codable {

		/// Array of refunds
		public var data: [ChargeRefundItem] = [ChargeRefundItem]()

		/// True if this list has another page of items after this one that can be fetched
		public var has_more: Bool	= false

		/// The total number of items available. This value is not included by default, but you can request it by specifying ?include[]=total_count
		public var total_count: Int = 0

		/// The URL where this list can be accessed
		public var url: String = ""

	}
}
