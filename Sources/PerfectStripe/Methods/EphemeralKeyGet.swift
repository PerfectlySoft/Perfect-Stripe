//
//  EphemeralKey.swift
//  PerfectStripe
//
//  Created by Fatih Nayebi on 2018-07-19.
//

import PerfectHTTP
import PerfectCURL
import codableRequest
import PerfectLib
import Foundation

extension Stripe {
    
    public static func ephemeralKeyGet(customer: String, apiVersion: String) throws -> EphemeralKey {
        
        let params: [String: Any] = ["customer": customer, "api_version": apiVersion]
        
        do {
            let response = try CodableRequest.request(.post, "\(Stripe.server)/ephemeral_keys", to: EphemeralKey.self, error: ErrorResponse.self, params: params, encoding: "form", bearerToken: Stripe.apiKey)
            return response
        } catch {
            throw error
        }
    }
}
