//
//  SourcesType.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

extension Stripe {
	public struct SourcesType: Codable {
		public var card: Int?
		public var bank_account: Int?
		public var bitcoin_receiver: Int?

	}
}
