//
//  BalanceList.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

import Foundation

extension Stripe {
	public struct BalanceList: Codable {
		public var currency: 			String
		public var amount:				Int
		public var source_types: 		SourcesType?
	}
}
