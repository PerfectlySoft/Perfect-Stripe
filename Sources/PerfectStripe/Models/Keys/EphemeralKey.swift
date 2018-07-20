//
//  EphemeralKey.swift
//  PerfectStripe
//
//  Created by Fatih Nayebi on 2018-07-19.
//

import Foundation

extension Stripe {
	public struct EphemeralKey: Codable {
		public var id: String
		public var object: String
		public var associatedObjects: [[String : String]]?
		public var created: Date?
		public var expires: Date?
		public var livemode: Bool
		public var secret: String?
		
		public enum CodingKeys: String, CodingKey {
			case id
			case object
			case associatedObjects = "associated_objects"
			case created
			case expires
			case livemode
			case secret
		}
	}
}
