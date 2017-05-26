//
//  Sunscription.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

public class StripeSubscription {

	/// Unique identifier for the object.
	public var id = ""

	///	A non-negative decimal (with at most two decimal places) between 0 and 100. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner’s Stripe account.
	public var application_fee_percent = "0.00" // as string

	///	If the subscription has been canceled with the at_period_end flag set to true, cancel_at_period_end on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
	public var cancel_at_period_end: Bool = false

	///	If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with cancel_at_period_end, canceled_at will still reflect the date of the initial cancellation request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
	public var canceled_at = 0

	///	Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created = 0

	///	End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
	public var current_period_end = 0

	///	Start of the current period that the subscription has been invoiced for.
	public var current_period_start = 0

	/// ID of the customer who owns the subscription.
	public var customer = ""

	///	Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
	public var discount: StripeDiscount = StripeDiscount()

	///	If the subscription has ended (either because it was canceled or because the customer was switched to a subscription to a new plan), the date the subscription ended.
	public var ended_at = 0

	/// List of [StripeSubscriptionItem]
	public var items: [StripeSubscriptionItem] = [StripeSubscriptionItem]()

	///	Flag indicating whether the object exists in live mode or test mode.
	public var livemode = false

	///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
	public var metadata = [String:Any]()

	///	Hash describing the plan the customer is subscribed to.
	public var plan: StripePlan = StripePlan()

	///	The quantity of the plan to which the customer should be subscribed. For example, if your plan is $10/user/month, and your customer has 5 users, you could pass 5 as the quantity to have the customer charged $50 (5 x $10) monthly.
	public var quantity = 0

	///	Date the most recent update to this subscription started.
	public var start = 0

	/// Possible values are trialing, active, past_due, canceled, or unpaid. A subscription still in its trial period is trialing and moves to active when the trial period is over. When payment to renew the subscription fails, the subscription becomes past_due. After Stripe has exhausted all payment retry attempts, the subscription ends up with a status of either canceled or unpaid depending on your retry settings. Note that when a subscription has a status of unpaid, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed. Additionally, updating customer card details will not lead to Stripe retrying the latest invoice.). After receiving updated card details from a customer, you may choose to reopen and pay their closed invoices.
	public var status: StripeSubscriptionStatus = .unpaid

	/// If provided, each invoice created by this subscription will apply the tax rate, increasing the amount billed to the customer.
	public var tax_percent = 0.00

	///	If the subscription has a trial, the end of that trial.
	public var trial_end = 0

	///	If the subscription has a trial, the beginning of that trial.
	public var trial_start = 0





	func parse(_ obj: [String: Any]) {

		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
			id = o as? String ?? ""
		}
		if let o = obj["application_fee_percent"], !(o is PerfectLib.JSONConvertibleNull) {
			application_fee_percent = o as? String ?? ""
		}
		if let o = obj["cancel_at_period_end"], o is Bool {
			cancel_at_period_end = o as? Bool ?? false
		}
		if let o = obj["canceled_at"], o is Int {
			canceled_at = o as? Int ?? 0
		}
		if let o = obj["created"], o is Int {
			created = o as? Int ?? 0
		}
		if let o = obj["current_period_end"], o is Int {
			current_period_end = o as? Int ?? 0
		}
		if let o = obj["current_period_start"], o is Int {
			current_period_start = o as? Int ?? 0
		}
		if let o = obj["customer"], !(o is PerfectLib.JSONConvertibleNull) {
			customer = o as? String ?? ""
		}
		if let o = obj["discount"], !(o is PerfectLib.JSONConvertibleNull) {
			discount.parse(o as? [String:Any] ?? [String:Any]())
		}
		if let o = obj["ended_at"], o is Int {
			ended_at = o as? Int ?? 0
		}
		if let oi = obj["items"], oi is [String: Any] {
			if let o = (oi as? [String:Any] ?? [String:Any]())["data"], o is [[String: Any]] {
				items = StripeSubscriptionItem.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
			}
		}
		if let o = obj["livemode"], o is Bool {
			livemode = o as? Bool ?? false
		}
		if let o = obj["metadata"], o is [String: Any] {
			metadata = o as? [String: Any] ?? [String: Any]()
		}
		if let o = obj["plan"], !(o is PerfectLib.JSONConvertibleNull) {
			plan.parse(o as? [String:Any] ?? [String:Any]())
		}
		if let o = obj["quantity"], o is Int {
			quantity = o as? Int ?? 0
		}
		if let o = obj["start"], o is Int {
			start = o as? Int ?? 0
		}
		if let o = obj["status"], !(o as? String ?? "").isEmpty {
			status = StripeSubscriptionStatus(rawValue: o as? String ?? "") ?? .unpaid
		}
		if let o = obj["tax_percent"], o is Double {
			tax_percent = o as? Double ?? 0.00
		}
		if let o = obj["trial_end"], o is Int {
			trial_end = o as? Int ?? 0
		}
		if let o = obj["trial_start"], o is Int {
			trial_start = o as? Int ?? 0
		}

	}


	func parseArray(_ o: [[String: Any]]) -> [StripeSubscription] {
		var out = [StripeSubscription]()
		o.forEach{
			data in
			let this = StripeSubscription()
			this.parse(data)
			out.append(this)
		}
		return out
	}

}
