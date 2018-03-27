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
			print("testBalanceFetch fail: \(error)")
			XCTFail()
		}
	}


	func testBalanceHistory() {
		do {
			_ = try Stripe.balanceHistory()
		} catch {
			print("testBalanceHistory fail: \(error)")
			XCTFail()
		}
	}

	func testBalanceTransaction() {
		do {
			let all = try Stripe.balanceHistory()
			let id = all.first?.id ?? ""
			_ = try Stripe.balanceTransaction(id)
		} catch {
			print("testBalanceTransaction fail: \(error)")
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
			print("testCustomerCreate fail: \(error)")
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
			print("Successful fail: \(error)")
		}
	}

	func testCustomerCreatePositive() {
		do {
			var customer = Stripe.Customer()
			customer.account_balance = 100
			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(c1.account_balance == 100, "Account balance recieved was not the same as set (100)")
		} catch {
			print("testCustomerCreatePositive fail: \(error)")
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
			print("testCustomerCreateNegative fail: \(error)")
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
			print("testCustomerGet fail: \(error)")
			XCTFail()
		}
	}

	func testCustomerUpdateEmpty() {
		do {
			let customer = Stripe.Customer()
			_ = try Stripe.customerUpdate(customer)
			XCTFail("Stripe.customerUpdate should have failed with an empty customer object supplied.")
		} catch {
			// success. expected to fail
			print("Successful fail: \(error)")
		}
	}

	func testCustomerUpdate() {
		do {
			var customer = Stripe.Customer()
			customer.description = "Hello, World!"
			var c1 = try Stripe.customerCreate(customer)
			XCTAssert(!c1.id.isEmpty, "The new customer's ID was not recieved in the object")

			c1.description = "Think global, act local."
			let c2 = try Stripe.customerUpdate(c1)
			XCTAssert(c2.description == "Think global, act local.", "The returned object has not had the update supplied.")

			let c3 = try Stripe.customerGet(c1.id)
			XCTAssert(c1.description == c3.description, "The retrieved object has not had the update supplied.")


		} catch {
			print("testCustomerUpdate fail: \(error)")
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
		("testCustomerUpdateEmpty", testCustomerUpdateEmpty),
		("testCustomerUpdate", testCustomerUpdate),
    ]
}
