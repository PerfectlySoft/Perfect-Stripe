//
//  SourceList.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-03-27.
//


/*
The customer’s payment sources.
*/
extension Stripe {
	public struct SourcesList: Codable {
		public var object = "list"
		public var data: [Source]?
		public var has_more: Bool?
		public var url: String?
		public var total_count: Int?
	}
}
