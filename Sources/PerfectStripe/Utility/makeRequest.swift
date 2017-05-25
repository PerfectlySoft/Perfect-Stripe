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
	/// Response:
	/// "data" - [String:Any]
	static func makeRequest(
		_ method: HTTPMethod,
		_ url: String,
		body: String = "",
		json: [String: Any] = [String: Any](),
		params: [String: Any] = [String: Any](),
		encoding: String = "JSON",
		bearerToken: String = Stripe.apiKey
		) -> ([String:Any], Int) {

		let curlObject = CURL(url: Stripe.server + url)
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Accept: application/json")
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Cache-Control: no-cache")
		curlObject.setOption(CURLOPT_USERAGENT, s: "PerfectAPI2.0")

		if !bearerToken.isEmpty {
			curlObject.setOption(CURLOPT_HTTPHEADER, s: "Authorization: Bearer \(bearerToken)")
		}

		switch method {
		case .post :
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
			curlObject.setOption(CURLOPT_POST, int: 1)
			curlObject.setOption(CURLOPT_POSTFIELDSIZE, int: byteArray.count)
			curlObject.setOption(CURLOPT_COPYPOSTFIELDS, v: UnsafeMutablePointer(mutating: byteArray))

			if encoding == "json" {
				curlObject.setOption(CURLOPT_HTTPHEADER, s: "Content-Type: application/json")
			} else {
				curlObject.setOption(CURLOPT_HTTPHEADER, s: "Content-Type: application/x-www-form-urlencoded")
			}

		default: //.get :
			curlObject.setOption(CURLOPT_HTTPGET, int: 1)
		}


		var header = [UInt8]()
		var bodyIn = [UInt8]()

		var code = 0
		var data = [String: Any]()
		var raw = [String: Any]()

		var perf = curlObject.perform()
		defer { curlObject.close() }

		while perf.0 {
			if let h = perf.2 {
				header.append(contentsOf: h)
			}
			if let b = perf.3 {
				bodyIn.append(contentsOf: b)
			}
			perf = curlObject.perform()
		}
		if let h = perf.2 {
			header.append(contentsOf: h)
		}
		if let b = perf.3 {
			bodyIn.append(contentsOf: b)
		}
		let _ = perf.1

		// assamble the body from a binary byte array to a string
//		let headerContent = String(bytes:header, encoding:String.Encoding.utf8)
//		if (headerContent?.characters.count)! > 0 {
//
//		}

		// assamble the body from a binary byte array to a string
		let content = String(bytes:bodyIn, encoding:String.Encoding.utf8)

		// parse the body data into a json convertible
		do {
			if (content?.characters.count)! > 0 {
				if (content?.startsWith("["))! {
					let arr = try content?.jsonDecode() as! [Any]
					data["response"] = arr
				} else {
					data = try content?.jsonDecode() as! [String : Any]
				}
			}
//			print("Debug from makeReqeuest: \(data)")
			return (data, curlObject.responseCode)
		} catch {
			return ([:], curlObject.responseCode)
		}
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
