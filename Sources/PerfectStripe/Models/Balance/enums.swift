//
//  enums.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//
extension Stripe {
	public enum FeeType: String, Codable {
		case application_fee, stripe_fee, tax
	}

	public enum TransactionStatus: String, Codable {
		case available, pending
	}

	public enum TransactionType: String, Codable {
		case adjustment, application_fee, application_fee_refund, charge, payment, payment_failure_refund, payment_refund, refund, transfer, transfer_cancel, transfer_failure, transfer_refund, validation, none
	}
}
