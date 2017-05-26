//
//  SubscriptionItem.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

///	Subscription items allow you to create customer subscriptions with more than one plan, 
/// making it easy to represent complex billing relationships.
public class StripeSubscriptionItem {

	/// Unique identifier for the object.
	public var id = ""

	///	Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created = 0

	///	Hash describing the plan the customer is subscribed to.
	public var plan: StripePlan = StripePlan()

	///	The quantity of the plan to which the customer should be subscribed.
	public var  quantity = 0




	func parse(_ obj: [String: Any]) {

		if let o = obj["id"], !(o is PerfectLib.JSONConvertibleNull) {
			id = o as? String ?? ""
		}
		if let o = obj["created"], o is Int {
			created = o as? Int ?? 0
		}
		if let o = obj["quantity"], o is Int {
			quantity = o as? Int ?? 0
		}
		if let o = obj["plan"], !(o is PerfectLib.JSONConvertibleNull) {
			plan.parse(o as? [String:Any] ?? [String:Any]())
		}

	}


	public static func parseArray(_ o: [[String: Any]]) -> [StripeSubscriptionItem] {
		var out = [StripeSubscriptionItem]()
		o.forEach{
			data in
			let this = StripeSubscriptionItem()
			this.parse(data)
			out.append(this)
		}
		return out
	}
}
