//
//  EphemeralKey.swift
//  PerfectStripe
//
//  Created by Fatih Nayebi on 2018-07-19.
//

import PerfectHTTP
import PerfectCURL
import PerfectLib
import Foundation
import codableRequest

extension Stripe {
	
	public static func ephemeralKeyGet(customer: String, apiVersion: String) throws -> EphemeralKey {
		
		let params = ["customer": customer]
		let headers = ["Stripe-Version": apiVersion]
		
		do {
			let response = try CodableRequest.request(.post, "\(Stripe.server)/ephemeral_keys", to: EphemeralKey.self, error: ErrorResponse.self, params: params, encoding: "form", bearerToken: Stripe.apiKey, headers: headers)
			return response
		} catch {
			throw error
		}
	}
}
