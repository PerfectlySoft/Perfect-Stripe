//
//  SubscriptionItem.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

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
}
