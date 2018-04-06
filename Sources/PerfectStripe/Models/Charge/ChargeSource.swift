//
//  Source.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

extension Stripe {
	public class ChargeSource: Codable {

		/// Two digit number representing the card's expiration month.
		public var exp_month: String = ""

		/// Two or four digit number representing the card's expiration year.
		public var exp_year: String = ""

		/// The card number, as a string without any separators.
		public var number: String = ""

		/// The type of payment source. Should be "card".
		public var object: String = "card"

		/// Card security code. Highly recommended to always include this value, but it's only required for accounts based in European countries.
		public var cvc: String = ""

		public var address_city: String = ""
		public var address_country: String = ""
		public var address_line1: String = ""
		public var address_line2: String = ""

		/// Cardholder's full name
		public var name: String = ""

		public var address_state: String = ""
		public var address_zip: String = ""

	}
}
