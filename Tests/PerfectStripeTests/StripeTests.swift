import XCTest
import codableRequest
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

	func testCustomerUpdateInvalid() {
		do {
			var customer = Stripe.Customer()
			customer.id = "XXX"
			customer.description = "Think global, act local."
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



	// ========================================================================
	// Charge Tests
	// ========================================================================

	func testChargeCreateNoCard() {
		do {
			// create customer to charge to
			var customer = Stripe.Customer()
			customer.description = "Hello, World!"
			customer = try Stripe.customerCreate(customer)
			XCTAssert(!customer.id.isEmpty, "The new customer's ID was not recieved in the object")

			// create charge
			var charge = Stripe.Charge()
			charge.amount = 100
			charge.currency = "CAD"
			charge.customer = customer.id

			let _ = try Stripe.chargeCreate(charge)
			XCTFail("This should have failed, no card!")
		} catch let error as ErrorResponse {
			XCTAssert(error.error?.code == "400", "Should have had an error 400")
		} catch {
			XCTFail("Generic fail: \(error)")
		}
	}

	func testChargeCreateEmpty() {
		do {
			var customer = Stripe.Customer()
			customer.description = "Hello, World!"
			let c1 = try Stripe.customerCreate(customer)
			XCTAssert(!c1.id.isEmpty, "The new customer's ID was not recieved in the object")

			let charge = Stripe.Charge()
			let _ = try Stripe.chargeCreate(charge)
			XCTFail("testChargeCreateEmpty should have failed with an empty charge object supplied.")
		} catch {
			// pass, should have failed!
		}
	}

	func testChargeCreate() {
		do {
			// create customer to charge to
			var customer = Stripe.Customer()
			customer.description = "Hello, World!"
			customer = try Stripe.customerCreate(customer)
			XCTAssert(!customer.id.isEmpty, "The new customer's ID was not recieved in the object")


			// create card
			var card = Stripe.Card()
			card.exp_month = 12
			card.exp_year = 2030
			card.number = "4242424242424242"
			card.cvc = "123"
			card.currency = "cad"
			let c = try Stripe.cardCreate(customer: customer.id, card: card)
			XCTAssert(!c.id.isEmpty, "The new card ID was not recieved in the object")


			// create charge
			var charge = Stripe.Charge()
			charge.amount = 100
			charge.currency = "CAD"
			charge.customer = customer.id

			let _ = try Stripe.chargeCreate(charge, sourceid: c.id)

		} catch let error as ErrorResponse {
			XCTFail("ErrorResponse fail: \(error)")
		} catch {
			XCTFail("Generic fail: \(error)")
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
		("testCustomerUpdateInvalid", testCustomerUpdateInvalid),
		("testCustomerUpdate", testCustomerUpdate),
		("testChargeCreateNoCard", testChargeCreateNoCard),
		("testChargeCreateEmpty", testChargeCreateEmpty),
    ]
}
