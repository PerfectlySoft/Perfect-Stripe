//
//  Source.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-04.
//

import Foundation

extension Stripe {
	public enum sourceFlow: String, Codable {
		case redirect, receiver, code_verification, none
	}
	public enum sourcePaymentMethod: String, Codable {
		case ach_credit_transfer, ach_debit, alipay, bancontact, bitcoin, card, eps, giropay, ideal, multibanco, p24, sepa_debit, sofort, three_d_secure
	}
	public enum sourceStatus: String, Codable {
		case canceled, chargeable, consumed, failed, pending
	}
	public enum sourceVerificationStatus: String, Codable {
		case pending, succeeded, failed
	}
	public enum sourceRedirectStatus: String, Codable {
		case pending, succeeded, not_required, failed
	}
	public enum sourceUsage: String, Codable {
		case reusable, single_use
	}


	public struct Source: Codable {
		/// Unique identifier for the object
		public var id: String?

		/// String representing the object’s type. Objects of the same type share the same value
		public var object				= "source"

		/// Amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for single_use sources.
		public var amount: Int?

		/// The client secret of the source. Used for client-side retrieval using a publishable key.
		public var client_secret: String?

		/// Information related to the code verification flow. Present if the source is authenticated by a verification code (flow is code_verification).
		public var code_verification: SourceCodeVerification?

		/// Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created: Int?

		/// Three-letter ISO code for the currency associated with the source. This is the currency for which the source will be chargeable once ready. Required for single_use sources
		public var currency: String?

		/// The authentication flow of the source. flow is one of redirect, receiver, code_verification, none.
		public var flow: sourceFlow?

		/// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
		public var livemode: Bool?

		/// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
		public var metadata: [String: String]?

		/// Information about the owner of the payment instrument that may be used or required by particular source types
		public var owner: SourceOwner?

		/// Information related to the receiver flow. Present if the source is a receiver (flow is receiver).
		public var receiver: SourceReceiver?

		/// Information related to the redirect flow. Present if the source is authenticated by a redirect (flow is redirect).
		public var redirect: SourceRedirect?

		/// Extra information about a source. This will appear on your customer’s statement every time you charge the source
		public var statement_descriptor: String?

		/// The status of the source, one of canceled, chargeable, consumed, failed, or pending. Only chargeable sources can be used to create a charge
		public var status: sourceStatus?

		/// The type of the source. The type is a payment method, one of ach_credit_transfer, ach_debit, alipay, bancontact, bitcoin, card, eps, giropay, ideal, multibanco, p24, sepa_debit, sofort, or three_d_secure. An additional hash is included on the source with a name matching this value. It contains additional information specific to the payment method used
		public var type: sourcePaymentMethod?

		/// Either reusable or single_use. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while other may leave the option at creation. If an incompatible value is passed, an error will be returned.
		public var usage: sourceUsage?


		// TODO: Make object that copes with each of the types from each type pave like https://stripe.com/docs/sources/sofort
//		"ach_credit_transfer":
	}
}
