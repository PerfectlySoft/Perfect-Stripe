//
//  ChargeEnums.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-18.
//
//

public enum StripeChargeRefundReason: String {
	case duplicate, fraudulent, requested_by_customer
}

public enum StripeChargeRefundStatus: String {
	case pending, succeeded, failed, cancelled
}

public enum StripeChargeStatus: String {
	case succeeded, pending, failed
}

public enum StripeChargeVerification: String {

	/// The CVC, Zip or Address provided is correct
	case pass,

	/// The CVC, Zip or Address provided is incorrect
	fail,

	/// The customer's bank did not check the CVC, Zip or Address provided.
	unavailable,

	/// The CVC, Zip or Address was provided but has not yet been checked. Checks are performed once a card is attached to a Customer object, or when a Charge is created
	unchecked
}
