//
//  makeRequest.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-02-22.
//
//

import Foundation
import PerfectLib
import PerfectCURL
import cURL
import SwiftString
import PerfectHTTP


extension Stripe {

	/// The function that triggers the specific interaction with a remote server
	/// Parameters:
	/// - method: The HTTP Method enum, i.e. .get, .post
	/// - route: The route required
	/// - body: The JSON formatted sring to sent to the server
	/// Response: CURLResponse
	static func makeRequest(
		_ method: HTTPMethod,
		_ url: String,
		body: String = "",
		json: [String: Any] = [String: Any](),
		params: [String: Any] = [String: Any](),
		encoding: String = "JSON",
		bearerToken: String = Stripe.apiKey
		) throws -> CURLResponse {

		var byteArray = [UInt8]()
		if !body.isEmpty {
			byteArray = [UInt8](body.utf8)
		} else if !json.isEmpty {
			do {
				byteArray = [UInt8]((try json.jsonEncodedString()).utf8)
			} catch {
				print("JSON Encoding error in POST body: \(error)")
			}
		} else if !params.isEmpty {
			byteArray = [UInt8]((Stripe.toParams(params).joined(separator: "&")).utf8)
		}

		var curlObject = CURLRequest(Stripe.server + url, .failOnError)
		if !byteArray.isEmpty {
			curlObject = CURLRequest(Stripe.server + url, .failOnError, .postData(byteArray))
		}
		curlObject.addHeader(.accept, value: "application/json")
		curlObject.addHeader(.cacheControl, value: "no-cache")
		curlObject.addHeader(.userAgent, value: "PerfectAPI3.0")

		if !bearerToken.isEmpty {
			curlObject.addHeader(.authorization, value: "Bearer \(bearerToken)")
		}

		if method == .post, encoding == "json" {
			curlObject.addHeader(.contentType, value: "application/json")
		} else if method == .post {
			curlObject.addHeader(.contentType, value: "application/x-www-form-urlencoded")
		}

		return try curlObject.perform()

	}

	private static func toParams(_ params:[String: Any]) -> [String] {
		var str = [String]()
		for (key, value) in params {
			let v = "\(value)".stringByEncodingURL
			str.append("\(key)=\(v)")
		}
		return str
	}
}
