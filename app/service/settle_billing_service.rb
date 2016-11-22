class SettleBillingService
  def self.call(billing)
    fail "Try to settle a billing which is already paid" if billing.is_paid

    if customer = billing.user.stripe_customer
      charge = Stripe::Charge.create(
        customer:    customer.id,
        amount:      billing.amount,
        currency:    "jpy",
        description: 'trip partner'
      )

      billing.update(
        is_paid:   true,
        charge_id: charge.id,
        paid_at:   Time.now
      )
    NotifySlackWorker.new.perform("[Stripe] charge succeeded", ":moneybag:", "#{billing.user.email}" + ",¥" + "#{billing.amount}")
    else
      fail "User do not have valid #stripe_customer"
    end
  rescue => e
    NotifySlackWorker.new.perform("決済に失敗しました。", ":sweat_smile:", e.message + "  :" + billing.id.to_s)
  end
end
