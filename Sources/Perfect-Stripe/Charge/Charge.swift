//
//  Charge.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-12.
//
//

import PerfectLib

/// To charge a credit or a debit card, you create a charge object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique random ID.
public class StripeCharge {
	/// Unique identifier for the object
	public var id					= ""

	/// A positive integer in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a 0-decimal currency) representing how much to charge. The minimum amount is $0.50 US or equivalent in charge currency.
	public var amount				= 0

	/// Amount in cents refunded (can be less than the amount attribute on the charge if a partial refund was issued).
	public var amount_refunded		= 0

	/// ID of the Connect application that created the charge
	public var application			= ""

	/// The application fee (if any) for the charge. See the Connect documentation for details
	public var application_fee		= 0

	/// ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
	public var balance_transaction	= ""

	/// If the charge was created without capturing, this boolean represents whether or not it is still uncaptured or has since been captured
	public var captured				= false

	/// Time at which the object was created. Measured in seconds since the Unix epoch
	public var created				= 0

	/// Three-letter ISO currency code, in lowercase. Must be a supported currency
	public var currency				= ""

	/// ID of the customer this charge is for if one exists.
	public var customer				= ""

	/// An arbitrary string attached to the object. Often useful for displaying to users
	public var description			= ""

	/// The account (if any) the charge was made on behalf of, with an automatic transfer. See the Connect documentation for details
	public var destination			= ""

	/// Details about the dispute if the charge has been disputed
	public var dispute				= ""

	/// Error code explaining reason for charge failure if available (see the errors section for a list of codes).
	public var failure_code: StripeErrorCode			= .none

	/// Message to user further explaining reason for charge failure if available.
	public var failure_message		= ""

	/// Hash with information on fraud assessments for the charge. Assessments reported by you have the key user_report and, if set, possible values of safe and fraudulent. Assessments from Stripe have the key stripe_report and, if set, the value fraudulent.
	public var fraud_details		= ""

	/// ID of the invoice this charge is for if one exists.
	public var invoice				= ""

	/// Flag indicating whether the object exists in live mode or test mode.
	public var livemode				= false

	/// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata				= [String: Any]()

	/// The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the Connect documentation for details.
	public var on_behalf_of			= ""

	/// ID of the order this charge is for if one exists.
	public var order				= ""

	/// Details about whether or not the payment was accepted, and why. See understanding declines for details.
	public var outcome				= StripeChargeOutcome()

	/// true if the charge succeeded, or was successfully authorized for later capture.
	public var paid				= false

	/// This is the email address that the receipt for this charge was sent to.
	public var receipt_email				= ""

	/// This is the transaction number that appears on email receipts sent for this charge.
	public var receipt_number				= ""

	/// Whether or not the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
	public var refunded				= false

	/// A list of refunds that have been applied to the charge.
	public var refunds: StripeChargeRefund = StripeChargeRefund()

	/// ID of the review associated with this charge if one exists.
	public var review				= ""

	/// Shipping information for the charge.
	public var shipping: StripeChargeShipping = StripeChargeShipping()

	/// For most Stripe users, the source of every charge is a credit or debit card. This hash is then the card object describing that card.
	public var source				= ""

	/// The transfer ID which created this charge. Only present if the charge came from another Stripe account. See the Connect documentation for details.
	public var source_transfer				= ""

	/// Extra information about a charge. This will appear on your customer’s credit card statement.
	public var statement_descriptor				= ""

	/// The status of the payment is either succeeded, pending, or failed.
	public var status: StripeChargeStatus = .pending

	/// ID of the transfer to the destination account (only applicable if the charge was created using the destination parameter).
	public var transfer				= ""

	/// A string that identifies this transaction as part of a group. See the Connect documentation for details.
	public var transfer_group				= ""



	// Change action
	public func create(

		// A positive integer in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a 0-decimal currency) representing how much to charge the card. The minimum amount is $0.50 US or equivalent in charge currency.
		amount: Int,
		// 3-letter ISO code for currency.
		currency: String,

		// A fee in cents that will be applied to the charge and transferred to the application owner's Stripe account. To use an application fee, the request must be made on behalf of another account, using the Stripe-Account header, an OAuth key, or the destination parameter. For more information, see the application fees documentation.
		application_fee: Int = 0,

		// Whether or not to immediately capture the charge. When false, the charge issues an authorization (or pre-authorization), and will need to be captured later. Uncaptured charges expire in 7 days. For more information, see authorizing charges and settling later
		capture: Bool = true,

		// An arbitrary string which you can attach to a charge object. It is displayed when in the web interface alongside the charge. Note that if you use Stripe to send automatic email receipts to your customers, your receipt emails will include the description of the charge(s) that they are describing.
		description: String = "",

		// If specified, the charge will be attributed to the destination account for tax reporting, and the funds from the charge will be transferred to the destination account. The ID of the resulting transfer will be returned in the transfer field of the response. See the documentation for details.
		destination: StripeChargeDestination = StripeChargeDestination(),

		// A string that identifies this transaction as part of a group. See the Connect documentation for details.
		transfer_group: String = "",

		// The Stripe account ID that these funds are intended for. Automatically set if you use the destination parameter. See the Connect documentation for details
		on_behalf_of: String = "",

		// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to metadata
		metadata: [String: Any] = [String: Any](),

		// The email address to send this charge's receipt to. The receipt will not be sent until the charge is paid. If this charge is for a customer, the email address specified here will override the customer's email address. Receipts will not be sent for test mode charges. If receipt_email is specified for a charge in live mode, a receipt will be sent regardless of your email settings.
		receipt_email: String = "",

		// Shipping information for the charge. Helps prevent fraud on charges for physical goods. For more information, see the Charge object documentation
		shipping: StripeChargeShipping = StripeChargeShipping(),

		// The ID of an existing customer that will be charged in this request.
		customer: String = "",

		// A payment source to be charged, such as a credit card. If you also pass a customer ID, the source must be the ID of a source belonging to the customer. Otherwise, if you do not pass a customer ID, the source you provide must either be a token, like the ones returned by Stripe.js, or a dictionary containing a user's credit card details, with the options described below. Although not all information is required, the extra info helps prevent fraud.
		source: StripeChargeSource = StripeChargeSource(),

		// SourceID String.
		sourceid: String = "",


		// An arbitrary string to be displayed on your customer's credit card statement. This may be up to 22 characters. As an example, if your website is RunClub and the item you're charging for is a race ticket, you may want to specify a statement_descriptor of RunClub 5K race ticket. The statement description may not include <>"' characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped. While most banks display this information consistently, some may display it incorrectly or not at all
		statement_descriptor: String = ""

		){

		// Required fields:
		// amount, currency
		// Either customer or source is required

		var params = [String: Any]()
		params["amount"] = amount
		params["currency"] = currency
		params["capture"] = capture
		if !description.isEmpty { params["description"] = description }
		if !metadata.isEmpty { params["metadata"] = metadata }
		if !receipt_email.isEmpty { params["receipt_email"] = receipt_email }
		if !shipping.address.city.isEmpty { params["shipping"] = shipping.asData() }

		if !customer.isEmpty {
			params["customer"] = customer
		}
		if !source.exp_month.isEmpty {
			params["source"] = source.asData()
		} else if !sourceid.isEmpty {
			params["source"] = sourceid
		}
		if !statement_descriptor.isEmpty { params["statement_descriptor"] = statement_descriptor }


		// Connect-only function
		if application_fee > 0 { params["application_fee"] = application_fee }
		if !destination.account.isEmpty { params["destination"] = destination.asData() }
		if !transfer_group.isEmpty { params["transfer_group"] = transfer_group }
		if !on_behalf_of.isEmpty { params["on_behalf_of"] = on_behalf_of }

//		print(params)

		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/charges", params: params)

		if code != 200 {
			print("StripeCharge.create Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}

	}



	
	


	// Retrieve Charge
	/// Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.
	public func get(_ charge: String) {
		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/charges/\(charge)")

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}
	
	// Update Charge
	/// Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
	/// This request accepts only the description, metadata, receipt_email, fraud_details, and shipping as arguments.
	public func update() {

		var params = [String: Any]()
		if !description.isEmpty { params["description"] = description }
		if !metadata.isEmpty { params["metadata"] = metadata }
		if !receipt_email.isEmpty { params["receipt_email"] = receipt_email }
		if !fraud_details.isEmpty { params["fraud_details"] = fraud_details }
		if !shipping.address.city.isEmpty { params["shipping"] = shipping.asData() }


		// execute request
		let (response, code) = Stripe.makeRequest(.post, "/charges/\(id)", params: params)

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}
	


	func parse(_ obj: [String: Any]) {

		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
			id = o as? String ?? ""
		}
		if let o = obj["amount"], o is Int {
			amount = o as? Int ?? 0
		}
		if let o = obj["amount_refunded"], o is Int {
			amount_refunded = o as? Int ?? 0
		}
		if let o = obj["application"], !(o is PerfectLib.JSONConvertibleNull) {
			application = o as? String ?? ""
		}
		if let o = obj["application_fee"], o is Int {
			application_fee = o as? Int ?? 0
		}
		if let o = obj["balance_transaction"], !(o is PerfectLib.JSONConvertibleNull) {
			balance_transaction = o as? String ?? ""
		}
		if let o = obj["captured"], o is Bool {
			captured = o as? Bool ?? false
		}
		if let o = obj["created"], o is Int {
			created = o as? Int ?? 0
		}
		if let o = obj["currency"], !(o is PerfectLib.JSONConvertibleNull) {
			currency = o as? String ?? ""
		}
		if let o = obj["customer"], !(o is PerfectLib.JSONConvertibleNull) {
			customer = o as? String ?? ""
		}
		if let o = obj["description"], !(o is PerfectLib.JSONConvertibleNull) {
			description = o as? String ?? ""
		}
		if let o = obj["destination"], !(o is PerfectLib.JSONConvertibleNull) {
			destination = o as? String ?? ""
		}
		if let o = obj["dispute"], !(o is PerfectLib.JSONConvertibleNull) {
			dispute = o as? String ?? ""
		}
		if let o = obj["failure_code"], !(o as? String ?? "").isEmpty {
			failure_code = StripeErrorCode(rawValue: o as? String ?? "") ?? .none
		}
		if let o = obj["failure_message"], !(o is PerfectLib.JSONConvertibleNull) {
			failure_message = o as? String ?? ""
		}
		if let o = obj["fraud_details"], !(o is PerfectLib.JSONConvertibleNull) {
			fraud_details = o as? String ?? ""
		}
		if let o = obj["invoice"], !(o is PerfectLib.JSONConvertibleNull) {
			invoice = o as? String ?? ""
		}
		if let o = obj["livemode"], o is Bool {
			livemode = o as? Bool ?? false
		}
		if let o = obj["metadata"], o is [String: Any] {
			metadata = o as? [String: Any] ?? [String: Any]()
		}
		if let o = obj["on_behalf_of"], !(o is PerfectLib.JSONConvertibleNull) {
			on_behalf_of = o as? String ?? ""
		}
		if let o = obj["order"], !(o is PerfectLib.JSONConvertibleNull) {
			order = o as? String ?? ""
		}

		// OUTCOME
		if let o = obj["outcome"], o is [String:Any] {
			outcome.parse(o as? [String:Any] ?? [String:Any]())
		}

		if let o = obj["paid"], o is Bool {
			paid = o as? Bool ?? false
		}
		if let o = obj["receipt_email"], !(o is PerfectLib.JSONConvertibleNull) {
			receipt_email = o as? String ?? ""
		}
		if let o = obj["receipt_number"], !(o is PerfectLib.JSONConvertibleNull) {
			receipt_number = o as? String ?? ""
		}
		if let o = obj["refunded"], o is Bool {
			refunded = o as? Bool ?? false
		}

		// REFUNDS
		if let o = obj["refunds"], o is [String:Any] {
			refunds.parse(o as? [String:Any] ?? [String:Any]())
		}

		if let o = obj["review"], !(o is PerfectLib.JSONConvertibleNull) {
			review = o as? String ?? ""
		}

		// SHIPPING
		if let o = obj["shipping"], o is [String:Any] {
			shipping.parse(o as? [String:Any] ?? [String:Any]())
		}

		if let o = obj["source"], !(o is PerfectLib.JSONConvertibleNull) {
			source = o as? String ?? ""
		}
		if let o = obj["source_transfer"], !(o is PerfectLib.JSONConvertibleNull) {
			source_transfer = o as? String ?? ""
		}
		if let o = obj["statement_descriptor"], !(o is PerfectLib.JSONConvertibleNull) {
			statement_descriptor = o as? String ?? ""
		}
		if let o = obj["status"], !(o as? String ?? "").isEmpty {
			status = StripeChargeStatus(rawValue: o as? String ?? "") ?? .pending
		}
		if let o = obj["transfer"], !(o is PerfectLib.JSONConvertibleNull) {
			transfer = o as? String ?? ""
		}
		if let o = obj["transfer_group"], !(o is PerfectLib.JSONConvertibleNull) {
			transfer_group = o as? String ?? ""
		}
	}
}




