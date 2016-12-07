class CreateTradeService
  def self.exec(item, buyer, exhibitor)
    Trade.create(
      item_id: item.id,
      buyer_id: buyer.id,
      user_id: exhibitor.id,
      trade_token: SecureRandom.hex(4)
    )
  end
end
