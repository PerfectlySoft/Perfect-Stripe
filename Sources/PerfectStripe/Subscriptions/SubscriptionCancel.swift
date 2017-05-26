//
//  SubscriptionDelete.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

extension StripeSubscription {

	/// Cancels a customer’s subscription. If you set the at_period_end parameter to true, the subscription will remain active until the end of the period, at which point it will be canceled and not renewed. By default, the subscription is terminated immediately. In either case, the customer will not be charged again for the subscription. Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period unless manually deleted. If you’ve set the subscription to cancel at period end, any pending prorations will also be left in place and collected at the end of the period, but if the subscription is set to cancel immediately, pending prorations will be removed.
	///	By default, all unpaid invoices for the customer will be closed upon subscription cancellation. We do this in order to prevent unexpected payment retries once the customer has canceled a subscription. However, you can reopen the invoices manually after subscription cancellation to have us proceed with automatic retries, or you could even re-attempt payment yourself on all unpaid invoices before allowing the customer to cancel the subscription at all.
	public func cancel(
		at_period_end: Bool = false
		) throws {

		guard !id.isEmpty else {
			throw InvalidInput()
		}

		// execute request
		let (response, code) = Stripe.makeRequest(.delete, "/subscriptions/\(id)?at_period_end=\(at_period_end)")

		if code != 200 {
			print("Subscription.delete Error: \(StripeHTTPErrorCode.fromCode(code))")
		} else {
			parse(response)
		}
	}

}
