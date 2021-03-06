# == Schema Information
#
# Table name: items
#
#  id                  :uuid             not null, primary key
#  user_id             :uuid             not null
#  buyer_id            :uuid
#  college_id          :uuid             not null
#  depertment_id       :string           not null
#  undergraduate_id    :string           not null
#  name                :string           not null
#  is_pickup           :boolean          default(FALSE), not null
#  reported            :boolean          default(FALSE), not null
#  price               :integer          not null
#  description         :text             not null
#  transaction_status  :integer          default("出品中"), not null
#  preservation_status :integer          not null
#  is_sold             :boolean          default(FALSE), not null
#  auther              :string
#  sold_at             :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord

  has_many :comments
  has_many :item_images, dependent: :destroy
  has_many :like_users, foreign_key: :like_id
  has_many :liker, class_name: "User", through: :like_users

  has_one :trade

  belongs_to :college
  belongs_to :depertment
  belongs_to :undergraduate
  belongs_to :user
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :chat_room

  # before_save :change_price_rate!

  mount_uploader :image, ImageUploader

  AVAILABLE_TRANSACTION_STATUS_HASH  = { "出品中" => 0, "取引中" => 1, "取引完了" => 2 }
  AVAILABLE_PRESERVATION_STATUS_HASH = { "新品・未使用" => 0, "未使用に近い" => 1, "目立った傷や汚れなし" => 2, "やや傷や汚れあり" => 3, "傷や汚れあり" => 4, "全体的に状態が悪い" => 5 }
  PRICE_LIMITATION                   = (10...100000)

  validates :name, presence: true, length: { maximum: 50 }
  # validates :row_price, presence: true
  validates :description, presence: true
  enum transaction_status: Item::AVAILABLE_TRANSACTION_STATUS_HASH
  enum preservation_status: Item::AVAILABLE_PRESERVATION_STATUS_HASH

  private def change_price_rate!
    self.update(
      price_with_margin: self.row_price*1.1
    )
  end
end
