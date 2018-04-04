//
//  SourceCodeVerification.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {

	public struct SourceCodeVerification: Codable {
		/// The number of attempts remaining to authenticate the source object with a verification code.
		public var attempts_remaining: Int?

		/// The status of the code verification, either pending (awaiting verification, attempts_remaining should be greater than 0), succeeded (successful verification) or failed (failed verification, cannot be verified anymore as attempts_remaining should be 0).
		public var status: sourceVerificationStatus?

	}
}
