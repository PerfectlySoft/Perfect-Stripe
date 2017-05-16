//
//  Balance.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-10.
//
//

public class StripeBalance {
	public var livemode				= false
	public var available			= [StripeBalanceList]()
	public var connect_reserved		= [StripeBalanceList]()
	public var pending				= [StripeBalanceList]()

	// Simple Balance fetch
	public func get() {
		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/balance")

		if code != 200 {
			print("Error: \(code)")
		} else {
			parse(response)
		}
	}
	
	public func history(limit: Int = 10, currency: String = "", type: StripeTransactionType = .none) throws -> [StripeBalance] {
		// make params
		var params = [String]()
		if limit >= 1, limit <= 100 { params.append("limit=\(limit)") }
		if !currency.isEmpty { params.append("currency=\(currency)") }
		if type != .none { params.append("type=\(type.rawValue)") }

		// execute request
		let (response, code) = Stripe.makeRequest(.get, "/balance/history?\(params.joined(separator: "&"))")

		if code != 200 {
			print("Error: \(code)")
			throw StripeError.init(httpcode: .badRequest)
		} else {
			if let o = response["data"], o is [[String: Any]] {
				let history = parseArray(o as? [[String: Any]] ?? [[String: Any]]())
				return history
			} else {
//				throw StripeError.init(code: .notFound)
				return [StripeBalance]() // empty array
			}
		}
	}

	func parseArray(_ o: [[String: Any]]) -> [StripeBalance] {
		var out = [StripeBalance]()
		o.forEach{
			data in
			let this = StripeBalance()
			this.parse(data)
			out.append(this)
		}
		return out
	}


	func parse(_ obj: [String: Any]) {
		if let o = obj["livemode"] {
			if o as? Bool == true { livemode = true }
		}
		if let o = obj["available"], o is [[String: Any]] {
			available = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
		}
		if let o = obj["connect_reserved"], o is [[String: Any]] {
			connect_reserved = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
		}
		if let o = obj["pending"], o is [[String: Any]] {
			pending = StripeBalanceList.parseArray(o as? [[String: Any]] ?? [[String: Any]]())
		}
	}
}




