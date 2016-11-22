class CreateBillingService
  def self.call(service, user, currency_sym)
    service.billings.new(user_id: user.id).tap do |billing|
      billing.currency = Billing::AVAILABLE_CURRENCY_HASH[currency_sym]
      billing.amount = ConvertAmount.call(service.amount, service.currency.to_sym, :jpy)
      billing.save
    end
  end
end
