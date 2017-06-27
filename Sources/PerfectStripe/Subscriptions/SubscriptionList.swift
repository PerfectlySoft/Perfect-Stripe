//
//  SubscriptionList.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-26.
//
//

extension StripeSubscription {

	public func list(

		/// A filter on the list based on the object created field. The value can be a string with an integer Unix timestamp
		/// Filtering based on dictionary values not currently supported
		created: String = "",

		/// The ID of the customer whose subscriptions will be retrieved.
		customer: String = "",

		/// A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list.
		ending_before: String = "",

		/// A limit on the number of objects to be returned. Limit can range between 1 and 100 items.
		limit: Int = 10,

		/// The ID of the plan whose subscriptions will be retrieved.
		plan: String = "",

		/// A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list.
		starting_after: String = "",

		/// The status of the subscriptions to retrieve. One of: trialing, active, past_due, unpaid, canceled, or all. Passing in a value of canceled will return all canceled subscriptions, including those belonging to deleted customers. Passing in a value of all will return subscriptions of all statuses.
		status: StripeSubscriptionStatus = .all

		) throws -> [StripeSubscription] {

		var params = [String]()
		if !created.isEmpty { params.append("created=\(created)") }
		if !customer.isEmpty { params.append("customer=\(customer)") }
		if !ending_before.isEmpty { params.append("ending_before=\(ending_before)") }
		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }
		if !plan.isEmpty { params.append("plan=\(plan)") }
		if !starting_after.isEmpty { params.append("starting_after=\(starting_after)") }
		params.append("status=\(status.rawValue)")

		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/subscriptions?\(params.joined(separator: "&"))")

		if code != 200 {
			print("Subscription.list Error: \(StripeHTTPErrorCode.fromCode(code))")
			throw StripeError.init(httpcode: .badRequest)
		} else {

			if let o = response["data"], o is [[String: Any]] {
				let list = StripeSubscription.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
				return list
			} else {
				return [StripeSubscription]() // empty array
			}
		}
	}
}
