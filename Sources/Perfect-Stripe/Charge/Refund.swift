//
//  Refund.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

public class StripeChargeRefund {

	/// Array of refunds
	public var data: [StripeChargeRefundItem] = [StripeChargeRefundItem]()

	/// True if this list has another page of items after this one that can be fetched
	public var has_more: Bool	= false

	/// The total number of items available. This value is not included by default, but you can request it by specifying ?include[]=total_count
	public var total_count: Int = 0

	/// The URL where this list can be accessed
	public var url: String = ""

}




public class StripeChargeRefundItem {

	/// Unique identifier for the object.
	public var id: String = ""

	/// Amount, in cents.
	public var amount: Int = 0

	/// Balance transaction that describes the impact on your account balance.
	public var balance_transaction: String = ""

	/// ID of the charge that was refunded.
	public var charge: String = ""

	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Int = 0

	/// Three-letter ISO currency code, in lowercase. Must be a supported currency.
	public var currency: String = ""

	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String = ""

	/// Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata:[String: Any] = [String: Any]()

	/// Reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer.
	public var reason: StripeChargeRefundReason = .requested_by_customer

	/// This is the transaction number that appears on email receipts sent for this refund.
	public var receipt_number: String = ""

	/// Status of the refund. For credit card refunds, this will always be succeeded. For other types of refunds, it can be pending, succeeded, failed, or cancelled.
	public var status: StripeChargeRefundStatus = .succeeded

}



public enum StripeChargeRefundReason {
	case duplicate, fraudulent, requested_by_customer
}

public enum StripeChargeRefundStatus {
	case pending, succeeded, failed, cancelled
}
