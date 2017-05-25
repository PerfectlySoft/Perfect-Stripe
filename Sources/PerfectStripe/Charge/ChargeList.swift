//
//  ChargeList.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-19.
//
//

import PerfectLib

extension StripeCharge {

	public func list(

		/// A filter on the list based on the object created field. The value can be a string with an integer Unix timestamp
		/// Filtering based on dictionary values not currently supported
		created: String = "",

		/// Only return charges for the customer specified by this customer ID
		customer: String = "",

		/// A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list.
		ending_before: String = "",

		/// A limit on the number of objects to be returned. Limit can range between 1 and 100 items.
		limit: Int = 10,

		/// A filter on the list based on the source of the charge. The value can be a dictionary with the following options:
		/// all, alipay_account, bank_account, bitcoin_receiver, or card.
		/// default: { object: 'all' }
		source: [String: String] = ["object": "all"],

		/// A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list.
		starting_after: String = "",

		/// Only return charges for this transfer group.
		transfer_group: String = ""

		) throws -> [StripeCharge] {

//		var params = [String: Any]()
//		if !created.isEmpty { params["created"] = created }
//		if !customer.isEmpty { params["customer"] = customer }
//		if !ending_before.isEmpty { params["ending_before"] = ending_before }
//		if limit > 0, limit <= 100 { params["limit"] = limit }
//		if !shipping.address.city.isEmpty { params["shipping"] = shipping.asData() }

		var params = [String]()
		if !created.isEmpty { params.append("created=\(created)") }
		if !customer.isEmpty { params.append("customer=\(customer)") }
		if !ending_before.isEmpty { params.append("ending_before=\(ending_before)") }
		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }

		if !starting_after.isEmpty { params.append("starting_after=\(starting_after)") }
		if !transfer_group.isEmpty { params.append("transfer_group=\(transfer_group)") }

		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/charges?\(params.joined(separator: "&"))")

		if code != 200 {
			print("StripeCharge.get Error: \(StripeHTTPErrorCode.fromCode(code))")
			throw StripeError.init(httpcode: .badRequest)
		} else {

			if let o = response["data"], o is [[String: Any]] {
				let list = parseArray(o as? [[String: Any]] ?? [[String: Any]]())
				return list
			} else {
				return [StripeCharge]() // empty array
			}
		}
	}

	func parseArray(_ o: [[String: Any]]) -> [StripeCharge] {
		var out = [StripeCharge]()
		o.forEach{
			data in
			let this = StripeCharge()
			this.parse(data)
			out.append(this)
		}
		return out
	}

}
