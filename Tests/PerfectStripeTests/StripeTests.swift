import XCTest
@testable import PerfectStripe

class StripeTests: XCTestCase {
	override func setUp() {
		super.setUp()
		Stripe.apiKey = ""
	}

	// ========================================================================
	// Ballance Tests
	// ========================================================================
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



	// ========================================================================
	// Customer Tests
	// ========================================================================
	func testCustomerCreate() {
		do {
			var customer = Stripe.Customer()
			customer.email = "me@iamjono.io"

			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(!c1.id.isEmpty, "The new customer's ID was not recieved in the object")
		} catch {
			print(error)
			XCTFail()
		}
	}

	func testCustomerCreatePositive() {
		do {
			var customer = Stripe.Customer()
			customer.account_balance = 100
			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(c1.account_balance == 100, "Account balance recieved was not the same as set (100)")
		} catch {
			XCTFail()
		}
	}

	func testCustomerCreateNegative() {
		do {
			var customer = Stripe.Customer()
			customer.account_balance = 100
			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(c1.account_balance == 100, "Account balance recieved was not the same as set (-100)")
		} catch {
			XCTFail()
		}
	}

    static var allTests = [
		("testBalanceFetch", testBalanceFetch),
		("testBalanceHistory", testBalanceHistory),
		("testBalanceTransaction", testBalanceTransaction),
		("testCustomerCreate", testCustomerCreate),
		("testCustomerCreatePositive", testCustomerCreatePositive),
		("testCustomerCreateNegative", testCustomerCreateNegative),
    ]
}
