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

	func testCustomerCreateEmpty() {
		do {
			let customer = Stripe.Customer()
			_ = try Stripe.customerCreate(customer)
			XCTFail("Stripe.customerCreate should have failed with an empty customer object supplied.")
		} catch {
			// success. expected to fail
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

	func testCustomerGet() {
		do {
			var customer = Stripe.Customer()
			customer.account_balance = 123
			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(!c1.id.isEmpty, "The new customer's ID was not recieved in the object")

			let c2 = try Stripe.customerGet(c1.id)
			XCTAssert(c1.id == c2.id, "The retrieved customer's ID was not the same as set on create.")

		} catch {
			print(error)
			XCTFail()
		}
	}


    static var allTests = [
		("testBalanceFetch", testBalanceFetch),
		("testBalanceHistory", testBalanceHistory),
		("testBalanceTransaction", testBalanceTransaction),
		("testCustomerCreate", testCustomerCreate),
		("testCustomerCreateEmpty", testCustomerCreateEmpty),
		("testCustomerCreatePositive", testCustomerCreatePositive),
		("testCustomerCreateNegative", testCustomerCreateNegative),
		("testCustomerGet", testCustomerGet),
    ]
}
