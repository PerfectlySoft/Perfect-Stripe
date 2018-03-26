//
//  ChargeCapture.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

//import PerfectLib
//
//extension Charge {

	/// Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you created a charge with the capture option set to false.
	/// Uncaptured payments expire exactly seven days after they are created. If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.

//	public func capture(
//		id: String,
//
//		/// The amount to capture, which must be less than or equal to the original amount. Any additional amount will be automatically refunded.
//		amount: Int = 0,
//
//		/// An application fee to add on to this charge. Can only be used with Stripe Connect.
//		application_fee: Int = 0,
//
//		/// An optional dictionary containing a new destination amount to use. Can only be used with destination charges created with Stripe Connect.
//		destination: StripeChargeDestination = StripeChargeDestination(),
//
//		/// The email address to send this charge’s receipt to. This will override the previously-specified email address for this charge, if one was set. Receipts will not be sent in test mode.
//		receipt_email: String = "",
//
//		/// An arbitrary string to be displayed on your customer’s credit card statement. This may be up to 22 characters. As an example, if your website is RunClub and the item you’re charging for is a race ticket, you may want to specify a statement_descriptor of RunClub 5K race ticket. The statement description may not include <>"' characters, and will appear on your customer’s statement in capital letters. Non-ASCII characters are automatically stripped. Updating this value will overwrite the previous statement descriptor of this charge. While most banks display this information consistently, some may display it incorrectly or not at all.
//		statement_descriptor: String = ""
//
//		) {
//
//		var params = [String: Any]()
//		if amount > 0 { params["amount"] = amount }
//		if application_fee > 0 { params["application_fee"] = application_fee }
//		if destination.amount > 0 { params["destination"] = destination.asData() }
//		if !receipt_email.isEmpty { params["receipt_email"] = receipt_email }
//		if !statement_descriptor.isEmpty { params["statement_descriptor"] = statement_descriptor }
//
//
//		// execute request
//		let (response, code) = Stripe.makeRequest(.post, "/charges/\(id)/capture", params: params)
//
//		if code != 200 {
//			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
//		} else {
//			parse(response)
//		}
//	}
//}

