import XCTest
@testable import PerfectStripe

class StripeTests: XCTestCase {
	override func setUp() {
		super.setUp()
		Stripe.apiKey = ""
	}

	func testBalanceFetch() {
		do {
			_ = try Stripe.balanceFetch()
		} catch {
			XCTFail()
		}
	}


	func testBalanceHistory() {
		do {
			_ = try Stripe.balanceHistory()
		} catch {
			print(error)
			XCTFail()
		}
	}

	func testBalanceTransaction() {
		do {
			let all = try Stripe.balanceHistory()
			let id = all.first?.id ?? ""
			_ = try Stripe.balanceTransaction(id)
		} catch {
			XCTFail()
		}
	}


    static var allTests = [
		("testBalanceFetch", testBalanceFetch),
		("testBalanceHistory", testBalanceHistory),
    ]
}
