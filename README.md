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

The master branch of this project currently compiles with **Xcode 9.2** or the **Swift 4.0.3** toolchain on macOS and Ubuntu.

## Usage

Import the module by including in your Package.swift file.

```
.Package(url: "https://github.com/PerfectlySoft/Perfect-Stripe.git", majorVersion: 3)
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

This is addressing the following object: [https://stripe.com/docs/api/curl#retrieve_balance](https://stripe.com/docs/api/curl#retrieve_balance)

``` swift
let balance = StripeBalance()
balance.get()
```

This will populate the `balance` object as seen in [https://github.com/PerfectlySoft/Perfect-Stripe/blob/master/Sources/PerfectStripe/Balance/Balance.swift](https://github.com/PerfectlySoft/Perfect-Stripe/blob/master/Sources/PerfectStripe/Balance/Balance.swift)

#### Retrieve balance history

Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.

``` swift
let balanceHistory = StripeBalance()
do {
	let history = try balanceHistory.history()
	print("history.count: \(history.count)")
} catch {
	print("history error: \(error)")
}
```

#### Retrieve a balance transaction

Retrieves the balance transaction with the given ID.

Returns a balance transaction if a valid balance transaction ID was provided.

``` swift 
let balanceTransaction = StripeBalanceTransaction()
balanceTransaction.get("<transaction_id>")

print("balanceTransaction.id: \(balanceTransaction.id)")
```

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




## Issues

We use JIRA for all bugs and support related issues.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
