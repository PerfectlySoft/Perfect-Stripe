# Perfect Stripe API

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" alt="Swift 4.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## Perfect Stripe API

**Note:** This is a work in progress and will grow to 100% API coverage over time. Your pull requests will help this!

This API will connect your Server Side Swift application with the [Stripe](https://stripe.com) payment gateway.

## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 9.3** or the **Swift 4.1** toolchain on macOS and Ubuntu.

Version 4 of Perfect-Stripe is not a drop-in update from version 3. It is a significant refactor to leverage Swift 4's Codable features.

## Usage

Import the module by including in your Package.swift file.

```
.Package(url: "https://github.com/PerfectlySoft/Perfect-Stripe.git", majorVersion: 4)
```

Then use in your file by importing:

```
import PerfectStripe
```


## Configuration

Obtain a Stripe API key, and set this for use:

``` swift
Stripe.apiKey = "<your api key>"
```

## Balances
### Get account balance

Retrieves the current account balance, based on the authentication that was used to make the request.

``` swift
let balance = try Stripe.balanceFetch()
```

### Retrieve balance history

Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.

``` swift
let balanceHistory = try Stripe.balanceHistory()
```

The returned result is `[BalanceTransaction]`

### Retrieve a balance transaction

Retrieves the balance transaction with the given ID.

Returns a balance transaction if a valid balance transaction ID was provided.

``` swift 
let balanceTransaction = try Stripe.balanceTransaction(id)
```

The returned result is of type `BalanceTransaction`.

## Customers

Customer objects allow you to perform recurring charges, and to track multiple charges, that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.

### List all customers

Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.

``` swift
let list = try Stripe.customerList()
```

The struct returned has the following definition, which echoes the respose from Stripe:

``` swift
public struct CustomerList: Codable {
	public var object				= "list"
	public var url					= "/v1/customers"
	public var has_more				= false
	public var data:				[Customer]?
}
```

The array of `Customer` is found in the `data` property. 

There are 4 parameters that the `customerList` will optionally accept:

- **limit:** Int, default 10. A limit on the number of objects to be returned. Limit can range between 1 and 100.
- **email:** A filter on the list based on the customer’s email field.
- **ending_before:** A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
- **starting_after:** A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.

For example, if you wish to find your users that have been registered with the email address `joe@mailinator.com ` you would invoke as follows:

``` swift
let list = try Stripe.customerList(email: "joe@mailinator.com")
```


### Create a new customer

To create a new customer in Stripe:

``` swift
var customer = Stripe.Customer()
customer.email = "me@example.com"

let customerObject = try Stripe.customerCreate(customer)

```

Returns a `Customer` object if the call succeeded. The returned object will have information about subscriptions, discount, and payment sources, if that information has been provided. If an invoice payment is due and a source is not provided, the call will return an error. If a non-existent plan or a non-existent or expired coupon is provided, the call will return an error.

If a source has been attached to the customer, the returned customer object will have a default_source attribute, which is an ID that can be expanded into the full source details when retrieving the customer

### Retrieve a customer

Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.

``` swift
let id = "cus_CbiUc5zkCs94am"
let customer = try Stripe.customerGet(id)
```

Returns a `Customer` object if a valid identifier was provided. When requesting the ID of a customer that has been deleted, a subset of the customer’s information will be returned, including a deleted property, which will be true.

### Update a customer

Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

``` swift
var customer = Stripe.Customer()
customer.description = "Hello, World!"
var customerObject = try Stripe.customerCreate(customer)

customerObject.description = "Think global, act local."
let customerObject = try Stripe.customerUpdate(customerObject)

```

### Delete a customer

Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.

``` swift
let idcheck = try Stripe.customerDelete(id)
```

If successful, the string returned is the id supplied.

## Cards

You can store multiple cards on a customer in order to charge the customer later. You can also store multiple debit cards on a recipient in order to transfer to those cards later.

### Creating a card

When you create a new credit card, you must specify a customer or recipient on which to create it.

If the card's owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should either update the customer to have a new `default_source`, or update the recipient to have a new `default_card`.

``` swift
var card = Stripe.Card()
card.exp_month = 12
card.exp_year = 2030
card.number = "4242424242424242"
card.cvc = "123"
card.currency = "cad"
let c = try Stripe.cardCreate(customer: customerid, card: card)
```

The response is the fully populated `card` object.

### Retrieve a card

The `Stripe.cardGet` method lets you retrieve details about a specific card stored on the customer.

``` swift
let getCard = try Stripe.cardGet(cardid, customer: customer.id)
```

A `card` object is returned.

### Update a card

If you need to update only some card details, like the billing address or expiration date, you can do so without having to re-enter the full card details. Also, Stripe works directly with card networks so that your customers can continue using your service without interruption.

When you update a card, Stripe will automatically validate the card.

Only `address_city`, `address_country`, `address_line1`, `address_line2`, `address_state`, `address_zip`, `exp_month`, `exp_year`, `metadata`, and `name` (The cardholder name).

``` swift
// create card
var card = Stripe.Card()
card.exp_month = 12
card.exp_year = 2030
card.number = "4242424242424242"
card.cvc = "123"
card.currency = "cad"
var c = try Stripe.cardCreate(customer: customer.id, card: card)

// update card
c.exp_month = 12
c.exp_year = 2031
c.name = "Joe Smith"
let c1 = try Stripe.cardUpdate(customer: customer.id, card: c)
```

### Delete a card

Permanently deletes a card. It cannot be undone.

``` swift
let idcheck = try Stripe.cardDelete(card.id, customer: customer.id)
```

If successful, the string returned is the id supplied.


## Charges

### Create a charge

To charge a credit card or other payment source, you create a Charge object. If your API key is in test mode, the supplied payment source (e.g., card) won't actually be charged, although everything else will occur as if in live mode. (Stripe assumes that the charge would have completed successfully).


### Retrieve a charge

Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.


### Update a charge

Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
This request accepts only the customer, description, fraud_details, metadata, receipt_email, and shipping arguments.


### Capture a charge

Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you created a charge with the capture option set to false.

Uncaptured payments expire exactly seven days after they are created. If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.

### List charges

Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.

``` swift
let chargeListTest = StripeCharge()
do {
	let list = try chargeListTest.list()
	print("chargeListTest returned: \(list)")
	list.forEach{
		c in
		print(c.id)
	}
} catch {
	print("chargeListTest error: \(error)")
}
```

This returns, for eample the follwoing sample output:

```
chargeListTest returned: [PerfectStripe.StripeCharge, PerfectStripe.StripeCharge]
ch_1ALEBOA9o38RUZnAwAJoJHok
ch_1AKWBHA9o38RUZnAFzf6IIx2
```




## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
