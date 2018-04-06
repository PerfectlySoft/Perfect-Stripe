//
//  SubscriptionList.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//

/*
The customer’s current subscriptions.
*/
extension Stripe {
	public struct SubscriptionsList: Codable {
		public var object = "list"
		public var data: [Subscription]?
		public var has_more: Bool?
		public var url: String?
		public var total_count: Int?
	}
}

