//
//  Customer.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

import PerfectLib

/*
	Customer objects allow you to perform recurring charges and track multiple charges that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.
*/
extension Stripe {
	public struct Customer: Codable {

		///	Unique identifier for the object.
		public var id = ""

		///	Current balance, if any, being stored on the customer’s account. If negative, the customer has credit to apply to the next invoice. If positive, the customer has an amount owed that will be added to the next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account for recurring billing purposes (i.e., subscriptions, invoices, invoice items).
		public var account_balance = 0

		///	The customer’s VAT identification number.
		public var business_vat_id = ""

		///	Time at which the object was created. Measured in seconds since the Unix epoch.
		public var created = 0 // timestamp

		///	Three-letter ISO code for the currency the customer can be charged in for recurring billing purposes.
		public var currency = ""

		/// ID of the default source attached to this customer.
		public var default_source = ""

		/// Whether or not the latest charge for the customer’s latest invoice has failed.
		public var delinquent = false

		///	An arbitrary string attached to the object. Often useful for displaying to users.
		public var description = ""

		///	Describes the current discount active on the customer, if there is one.
		public var discount: Discount = Discount()

		///	The customer’s email address.
		public var email = ""

		///	Flag indicating whether the object exists in live mode or test mode.
		public var livemode = false

		///	Set of key/value pairs that you can attach to an object. It can be useful for storing additional information about the object in a structured format.
		public var metadata = [String:String]()

		///	Shipping information associated with the customer.
		public var shipping = ShippingAddress()

		/// The customer’s payment sources, if any.
		public var sources = [ChargeSource]()

		/// The customer’s current subscriptions, if any.
		public var subscriptions = [Subscription]()

	}

}
