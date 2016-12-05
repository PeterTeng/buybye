class Billing < ApplicationRecord

  belongs_to :user

  def settle!
    return nil if self.is_paid
    if customer = self.user.stripe_customer
      charge = Stripe::Charge.create(
        customer:    customer.id,
        amount:      self.amount_with_tax,
        description: 'buybye',
        currency:    'jpy'
      )
      self.update is_paid: true, charge_id: charge.id
    else
      fail "Client do not have valid #stripe_customer"
    end
    rescue => e
     NotifySlackWorker.new.perform("決済バッチが失敗しました", ":sweat_smile:", e.message + "  :" + self.id.to_s)
  end
end
