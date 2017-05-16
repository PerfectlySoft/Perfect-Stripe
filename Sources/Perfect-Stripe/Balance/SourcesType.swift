//
//  SourcesType.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-11.
//
//

public class StripeSourcesType {
	public var paymentType = "card"
	public var amount = 0

	static func parse(_ o: [String: Any]) -> StripeSourcesType {
		let this = StripeSourcesType()
		if !o.isEmpty {
			(this.paymentType, this.amount) = o.first as? (String, Int) ?? ("", 0)
		}
		return this
	}

}
