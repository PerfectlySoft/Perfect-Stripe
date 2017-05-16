//
//  BalanceList.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

public class StripeBalanceList {
	public var currency = ""
	public var amount = 0
	public var source_types = StripeSourcesType()


	static func parseArray(_ o: [[String: Any]]) -> [StripeBalanceList] {
		var out = [StripeBalanceList]()

		o.forEach{
			data in
			let this = StripeBalanceList()
			if let item = data["currency"] { this.currency = item as? String ?? "" }
			if let item = data["amount"] { this.amount = item as? Int ?? 0 }
			if let item = data["source_types"], item is [String: Any] {
				this.source_types = StripeSourcesType.parse(item as? [String: Any] ?? [String: Any]())
			}
			out.append(this)
		}
		return out
	}


}
