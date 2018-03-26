//
//  enumCollection.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension Stripe {

	public enum Interval: String, Codable {
		case day, week, month, year
	}

	public enum CouponDuration: String, Codable {
		case forever, once, repeating
	}

	public enum SubscriptionStatus: String, Codable {
		/// Note that "all" is ONLY for list sub method
		case trialing, active, past_due, canceled, unpaid, all
	}

	// From Balance
	public enum FeeType: String, Codable {
		case application_fee, stripe_fee, tax
	}

	public enum TransactionStatus: String, Codable {
		case available, pending
	}

	public enum TransactionType: String, Codable {
		case adjustment, application_fee, application_fee_refund, charge, payment, payment_failure_refund, payment_refund, refund, transfer, transfer_cancel, transfer_failure, transfer_refund, validation, none
	}

	// From Charge
	public enum ChargeRefundReason: String, Codable {
		case duplicate, fraudulent, requested_by_customer
	}

	public enum ChargeRefundStatus: String, Codable {
		case pending, succeeded, failed, cancelled
	}

	public enum ChargeStatus: String, Codable {
		case succeeded, pending, failed
	}

	public enum ChargeVerification: String, Codable {

		/// The CVC, Zip or Address provided is correct
		case pass,

		/// The CVC, Zip or Address provided is incorrect
		fail,

		/// The customer's bank did not check the CVC, Zip or Address provided.
		unavailable,

		/// The CVC, Zip or Address was provided but has not yet been checked. Checks are performed once a card is attached to a Customer object, or when a Charge is created
		unchecked
	}

	public enum ChargeNetworkStatus: String, Codable {
		case approved_by_network, declined_by_network, not_sent_to_network, reversed_after_approval
	}

	public enum RiskLevel: String, Codable {
		case normal, elevated, highest, not_assessed, unknown
	}

	public enum ChargeType: String, Codable {
		case authorized, manual_review, issuer_declined, blocked, invalid
	}
}
