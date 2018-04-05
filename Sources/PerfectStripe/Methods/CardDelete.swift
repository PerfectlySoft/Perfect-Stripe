//
//  CardDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	// container for response
	private struct CardDeleteContainer: Codable {
		public var deleted: Bool?
		public var id: String?
	}

	/// Deletes a customer object
	public static func cardDelete(_ id: String, customer: String) throws -> String? {

		// execute request
		do {
			let response: CardDeleteContainer = try CodableRequest.request(.delete, "\(Stripe.server)/customers/\(customer)/sources/\(id)", to: CardDeleteContainer.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response.id
		} catch {
			throw error
		}

	}
}
