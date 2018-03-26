//
//  Charge.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-12.
//
//

import PerfectLib

extension Stripe {
/// To charge a credit or a debit card, you create a charge object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique random ID.
	public struct Card: Codable {
		/// Unique identifier for the object
		public var id					= ""

		/// String representing the object’s type. Objects of the same type share the same value.
		/// string , value is "card"
		public var object				= "card"

		/// The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.
		/// CUSTOM ONLY
		/// string
		public var account: String?

		/// City/District/Suburb/Town/Village.
		public var address_city: String?

		/// Billing address country, if provided when creating card.
		public var address_country: String?

		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?

		/// If address_line1 was provided, results of the check: pass, fail, unavailable, or unchecked.
		public var address_line1_check: String?

		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?

		/// State/County/Province/Region.
		public var address_state: String?

		/// ZIP or postal code.
		public var address_zip: String?

		/// If address_zip was provided, results of the check: pass, fail, unavailable, or unchecked.
		public var address_zip_check: String?

		/// A set of available payout methods for this card. Will be either ["standard"] or ["standard", "instant"]. Only values from this set should be passed as the method when creating a transfer.
		/// array containing strings
		public var available_payout_methods: [String]?

		/// Card brand. Can be American Express, Diners Club, Discover, JCB, MasterCard, UnionPay, Visa, or Unknown.
		public var brand: String?

		/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you’ve collected.
		public var country: String?

		/// Three-letter ISO code for currency. Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.
		public var currency: String?

		/// The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
		public var customer: String?

		/// If a CVC was provided, results of the check: pass, fail, unavailable, or unchecked.
		public var cvc_check: String?

		/// Only applicable on accounts (not customers or recipients). This indicates whether this card is the default external account for its currency.
		public var default_for_currency: Bool?

		/// (For tokenized numbers only.) The last four digits of the device account number.
		public var dynamic_last4: String?

		/// Two-digit number representing the card’s expiration month.
		public var exp_month: Int?

		/// Four-digit number representing the card’s expiration year.
		public var exp_year: Int?

		/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example.
		public var fingerprint: String?

		/// Card funding type. Can be credit, debit, prepaid, or unknown.
		public var funding: String?

		/// The last four digits of the card.
		public var last4: String?

		/// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
		public var metadata: [String: String]?

		/// Cardholder name.
		public var name: String?

		/// The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.
		public var recipient: String?

		/// If the card number is tokenized, this is the method that was used. Can be apple_pay or android_pay.
		public var tokenization_method: String?


	}
}
