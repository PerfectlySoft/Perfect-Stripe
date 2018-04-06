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

``` swift
.Package(
	url: "https://github.com/PerfectlySoft/Perfect-Stripe.git",
	majorVersion: 4
	)
```

Then use in your file by importing:

``` swift
import PerfectStripe
```


## Configuration

Obtain a Stripe API key, and set this for use:

``` swift
Stripe.apiKey = "<your api key>"
```

## Documentation

Usage documentation can be found at [https://github.com/iamjono/Perfect-Stripe/wiki](https://github.com/iamjono/Perfect-Stripe/wiki)




## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
