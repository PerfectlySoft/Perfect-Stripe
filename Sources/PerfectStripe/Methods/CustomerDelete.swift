//
//  CustomerDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2018-04-05.
//

import PerfectHTTP
import codableRequest

extension Stripe {

	// container for response
	private struct CustomerDeleteContainer: Codable {
		public var deleted: Bool?
		public var id: String?
	}

	/// Deletes a customer object
	public static func customerDelete(_ id: String) throws -> String? {

		// execute request
		do {
			let response: CustomerDeleteContainer = try CodableRequest.request(.delete, "\(Stripe.server)/customers/\(id)", to: CustomerDeleteContainer.self, error: ErrorResponse.self, bearerToken: Stripe.apiKey)
			return response.id
		} catch {
			throw error
		}

	}
}
