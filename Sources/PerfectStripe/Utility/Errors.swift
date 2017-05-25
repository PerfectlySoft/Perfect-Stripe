//
//  Errors.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-09.
//
//


public struct StripeError: Error {
	public var httpcode: StripeHTTPErrorCode	= .OK
	public var type: StripeErrorType			= .none
	public var charge: String					= ""
	public var message: String					= ""
	public var code: StripeErrorCode			= .none
	public var decline_code: String				= ""
	public var param: String					= ""


	/// Initializer
	public init(
			httpcode: StripeHTTPErrorCode = .OK,
			type: StripeErrorType = .none,
			charge: String = "",
			message: String = "",
			code: StripeErrorCode = .none,
			decline_code: String = "",
			param: String = ""
		) {

		self.httpcode = httpcode
		self.type = type
		self.charge = charge
		self.message = message
		self.code = code
		self.decline_code = decline_code
		self.param = param
	}
}

/**
Stripe Error Codes
*/
public enum StripeHTTPErrorCode: String {

	/// Everything worked as expected
	case OK = "OK",

	/// The request was unacceptable, often due to missing a required parameter
	badRequest = "Bad Request",

	/// No valid API key provided.
	unauthorized = "Unauthorized",

	/// The parameters were valid but the request failed
	requestFailed = "Request Failed",

	/// The requested resource doesn't exist
	notFound = "Not Found",

	/// The request conflicts with another request (perhaps due to using the same idempotent key)
	conflict = "Conflict",

	/// Too many requests hit the API too quickly. We recommend an exponential backoff of your requests
	tooManyRequests = "Too Many Requests",

	/// Something went wrong on Stripe's end.
	serverError = "Server Error"


	public static func fromCode(_ code: Int) -> StripeHTTPErrorCode {
		switch code {
		case 200:
			return .OK
		case 400:
			return .badRequest
		case 401:
			return .unauthorized
		case 402:
			return .requestFailed
		case 404:
			return .notFound
		case 409:
			return .conflict
		case 429:
			return .tooManyRequests
		default:
			return .serverError
		}
	}
}

public enum StripeErrorType: String {
	case none = "No Error",
	api_connection_error = "Failure to connect to Stripe's API.",
	api_error = "API error.",
	authentication_error = "Failure to properly authenticate yourself in the request.",
	card_error = "Card errors are the most common type of error you should expect to handle. They result when the user enters a card that can't be charged for some reason.",
	invalid_request_error = "Invalid request errors arise when your request has invalid parameters.",
	rate_limit_error = "Too many requests hit the API too quickly.",
	validation_error = "Errors triggered by our client-side libraries when failing to validate fields (e.g., when a card number or expiration date is invalid or incomplete)."
}

public enum StripeErrorCode: String {
	case none = "No Error",
	invalid_number = "The card number is not a valid credit card number",
	invalid_expiry_month = "The card's expiration month is invalid",
	invalid_expiry_year = "The card's expiration year is invalid",
	invalid_cvc = "The card's security code is invalid",
	invalid_swipe_data = "The card's swipe data is invalid",
	incorrect_number = "The card number is incorrect",
	expired_card = "The card has expired",
	incorrect_cvc = "The card's security code is incorrect",
	incorrect_zip = "The card's zip code failed validation",
	card_declined = "The card was declined",
	missing = "There is no card on a customer that is being charged",
	processing_error = "An error occurred while processing the card"
}






/// The API Response was not expected. This could be an API server error or library error
public struct InvalidAPIResponse: Error {
	/// User-presentable error message
	public let description = "Invalid API Response"

	/// Empty initializer
	public init() {}
}

/// We could not establish a connection to this API server
public struct APIConnectionError: Error {
	/// User-presentable error message
	public let description = "Unable to connect to the API"

	/// Empty initializer
	public init() {}
}

/// We encountered unexpected input. This is most likely programmer error.
public struct InvalidInput: Error {
	/// User-presentable error message
	public let description = "Unexpected error occurred."

	/// Empty initializer
	public init() {}
}
