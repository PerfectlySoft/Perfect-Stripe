//
//  Balance.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

import Foundation

extension Stripe {
	public struct Balance: Codable {
		public var object				= "balance"
		public var available: 			[BalanceList]?
		public var connect_reserved:	[BalanceList]?
		public var livemode				= false
		public var pending:				[BalanceList]?
	}
}
