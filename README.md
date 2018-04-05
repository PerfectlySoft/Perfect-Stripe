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

## Documentation

### Configuration

Obtain a Stripe API key, and set this for use:

``` swift
Stripe.apiKey = "<your api key>"
```

### Balances
#### Get account balance

Retrieves the current account balance, based on the authentication that was used to make the request.

``` swift
let balance = try Stripe.balanceFetch()
```

#### Retrieve balance history

Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.

``` swift
let balanceHistory = try Stripe.balanceHistory()
```

The returned result is `[BalanceTransaction]`

#### Retrieve a balance transaction

Retrieves the balance transaction with the given ID.

Returns a balance transaction if a valid balance transaction ID was provided.

``` swift 
let balanceTransaction = try Stripe.balanceTransaction(id)
```

The returned result is of type `BalanceTransaction`.

### Customers

Customer objects allow you to perform recurring charges, and to track multiple charges, that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.

#### Create a new customer

To create a new customer in Stripe:

``` swift
var customer = Stripe.Customer()
customer.email = "me@example.com"

let customerObject = try Stripe.customerCreate(customer)

```

Returns a `Customer` object if the call succeeded. The returned object will have information about subscriptions, discount, and payment sources, if that information has been provided. If an invoice payment is due and a source is not provided, the call will return an error. If a non-existent plan or a non-existent or expired coupon is provided, the call will return an error.

If a source has been attached to the customer, the returned customer object will have a default_source attribute, which is an ID that can be expanded into the full source details when retrieving the customer

#### Retrieve a customer

Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.

``` swift
let id = "cus_CbiUc5zkCs94am"
let customer = try Stripe.customerGet(id)
```

Returns a `Customer` object if a valid identifier was provided. When requesting the ID of a customer that has been deleted, a subset of the customer’s information will be returned, including a deleted property, which will be true.

#### Update a customer

Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

``` swift
var customer = Stripe.Customer()
customer.description = "Hello, World!"
var customerObject = try Stripe.customerCreate(customer)

customerObject.description = "Think global, act local."
let customerObject = try Stripe.customerUpdate(customerObject)

```

#### Delete a customer

Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.

``` swift
let idcheck = try Stripe.customerDelete(id)
```

If successful, the string returned is the id supplied.

### Charges

#### List charges

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

### Coupons


### Discounts

### Disputes

### Events

### File uploads

### Payouts

### Plans


### Refunds

### Shipping


### Subscriptions



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
