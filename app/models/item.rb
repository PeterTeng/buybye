class Item < ApplicationRecord
  has_many :comments
  has_many :item_images
  belongs_to :user
  has_many :favorites

  AVAILABLE_TRANSACTION_STATUS_HASH  = { "取引中" => 0, "取引完了" => 1 }
  AVAILABLE_PRESERVATION_STATUS_HASH = { "新品・未使用" => 0, "未使用に近い" => 1, "目立った傷や汚れなし" => 2, "やや傷や汚れあり" => 3, "傷や汚れあり" => 4, "全体的に状態が悪い" => 5 }
  PRICE_LIMITATION                   = (10...100000)

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, inclusion: { in: Item::PRICE_LIMITATION }
  enum transaction_status: Item::AVAILABLE_TRANSACTION_STATUS_HASH
  enum preservation_status: Item::AVAILABLE_PRESERVATION_STATUS_HASH

end
