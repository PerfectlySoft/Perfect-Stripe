import XCTest
@testable import Perfect_Stripe

class Perfect_StripeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Perfect_Stripe().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
