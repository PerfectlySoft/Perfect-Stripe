//
//  SourceRedirect.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {

	/// Information related to the redirect flow. Present if the source is authenticated by a redirect (flow is redirect).
	public struct SourceRedirect: Codable {

		/// The failure reason for the redirect, either user_abort (the customer aborted or dropped out of the redirect flow), declined (the authentication failed or the transaction was declined), or processing_error (the redirect failed due to a technical error). Present only if the redirect status is failed.
		public var failure_reason: String?

		/// The URL you provide to redirect the customer to after they authenticated their payment.
		public var return_url: String?

		///The status of the redirect, either pending (ready to be used by your customer to authenticate the transaction), succeeded (succesful authentication, cannot be reused) or not_required (redirect should not be used) or failed (failed authentication, cannot be reused).
		public var status: sourceRedirectStatus?

		/// The URL provided to you to redirect a customer to as part of a redirect authentication flow.
		public var url: String?

	}
}
