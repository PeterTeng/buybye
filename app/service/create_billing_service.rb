class CreateBillingService
  def self.call(item, buyer)
    billing = buyer.billings.new
    billing.update(
      amount_with_tax: item.row_price*1.1 - item.row_price
    )
    billing.settle!
  end
end
