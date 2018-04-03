//
//  makeRequest.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-02-22.
//
//

//import Foundation
//import PerfectLib
//import PerfectCURL
//import cURL
//import SwiftString
//import PerfectHTTP
//
//protocol ErrorResponseProtocol: Codable, Error {}
//
//public struct ErrorResponse: ErrorResponseProtocol {
//	public var error: ErrorMsg?
//}
//public struct ErrorMsg: Codable {
//	public var message: String?
//	public var type: String?
//	public var param: String?
//	public var code: String?
//}
//
//public struct CodableRequest {
////	public var authentication = "" //Stripe.apiKey
////	public var server = "" //Stripe.server
//
//	/// The function that triggers the specific interaction with a remote server
//	/// Parameters:
//	/// - method: The HTTP Method enum, i.e. .get, .post
//	/// - route: The route required
//	/// - body: The JSON formatted sring to sent to the server
//	/// Response: CURLResponse
//	static func request<T: Codable, E: ErrorResponseProtocol>(
//		_ method: HTTPMethod,
//		_ url: String,
//		to responseType: T.Type,
//		error errorType: E.Type,
//		params: [String: Any] = [String: Any](),
//		encoding: String = "JSON",
//		bearerToken: String = "") throws -> T {
//
//		var curlObject = CURLRequest(url)
//		if !params.isEmpty {
//			var byteArray = [UInt8]()
//			byteArray = [UInt8]((self.toParams(params).joined(separator: "&")).utf8)
//			curlObject = CURLRequest(url, .postData(byteArray))
//		}
//
//		curlObject.addHeader(.accept, value: "application/json")
//		curlObject.addHeader(.cacheControl, value: "no-cache")
//		curlObject.addHeader(.userAgent, value: "PerfectAPI3.0")
//
//		if !bearerToken.isEmpty {
//			curlObject.addHeader(.authorization, value: "Bearer \(bearerToken)")
//		}
//
//		if method == .post, encoding == "json" {
//			curlObject.addHeader(.contentType, value: "application/json")
//		} else if method == .post {
//			curlObject.addHeader(.contentType, value: "application/x-www-form-urlencoded")
//		}
//
//		do {
//			let response = try curlObject.perform()
//
//			if response.responseCode > 400 {
//				let e = try response.bodyJSON(errorType)
//				throw e
//			}
//			let model = try response.bodyJSON(responseType)
//			return model as T
//
//		} catch let error as CURLResponse.Error {
//			let e = try error.response.bodyJSON(errorType)
//			throw e
//
//		} catch {
//			throw error
//		}
//	}
//
//
//	private static func toParams(_ params:[String: Any]) -> [String] {
//		var str = [String]()
//		for (key, value) in params {
//			let v = "\(value)".stringByEncodingURL
//			str.append("\(key)=\(v)")
//		}
//		return str
//	}
//}
