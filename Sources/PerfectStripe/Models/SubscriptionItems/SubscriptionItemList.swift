//
//  SubscriptionItemList.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-26.
//
//

extension StripeSubscriptionItem {

//	public func list(
//
//		/// The ID of the subscription whose items will be retrieved.
//		subscription: String,
//
//		/// A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list.
//		ending_before: String = "",
//
//		/// A limit on the number of objects to be returned. Limit can range between 1 and 100 items.
//		limit: Int = 10,
//
//		/// A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list.
//		starting_after: String = ""
//
//		) throws -> [StripeSubscriptionItem] {
//
//		guard !subscription.isEmpty else {
//			throw InvalidInput()
//		}
//
//
//		var params = [String]()
//		params.append("subscription=\(subscription)")
//		if !ending_before.isEmpty { params.append("ending_before=\(ending_before)") }
//		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }
//
//		if !starting_after.isEmpty { params.append("starting_after=\(starting_after)") }
//
//		// execute request
//		let (response, code) = Stripe.makeRequest(.get, "/subscription_items?\(params.joined(separator: "&"))")
//
//		if code != 200 {
//			print("StripeSubscriptionItem.list Error: \(StripeHTTPErrorCode.fromCode(code))")
//			throw StripeError.init(httpcode: .badRequest)
//		} else {
//
//			if let o = response["data"], o is [[String: Any]] {
//				return StripeSubscriptionItem.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
//			} else {
//				return [StripeSubscriptionItem]() // empty array
//			}
//		}
//	}

	
}
