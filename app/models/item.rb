# == Schema Information
#
# Table name: items
#
#  id                  :uuid             not null, primary key
#  type                :string           default("Exhibit"), not null
#  user_id             :uuid             not null
#  name                :string           not null
#  is_pickup           :boolean          default(FALSE), not null
#  price               :integer          not null
#  transaction_status  :integer          not null
#  preservation_status :integer          not null
#  is_sold             :boolean          not null
#  auther              :string           not null
#

class Item < ApplicationRecord

  has_many :comments
  has_many :item_images, dependent: :destroy
  has_many :favorites

  belongs_to :college
  belongs_to :depertment
  belongs_to :undergraduate
  belongs_to :user
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :chat_room

  AVAILABLE_TRANSACTION_STATUS_HASH  = { "出品中" => 0, "取引中" => 1, "取引完了" => 2 }
  AVAILABLE_PRESERVATION_STATUS_HASH = { "新品・未使用" => 0, "未使用に近い" => 1, "目立った傷や汚れなし" => 2, "やや傷や汚れあり" => 3, "傷や汚れあり" => 4, "全体的に状態が悪い" => 5 }
  PRICE_LIMITATION                   = (10...100000)

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, inclusion: { in: Item::PRICE_LIMITATION }

  enum transaction_status: Item::AVAILABLE_TRANSACTION_STATUS_HASH
  enum preservation_status: Item::AVAILABLE_PRESERVATION_STATUS_HASH


  def deleted_your_item
    self.user.
    self.destroy
  end
end
