# == Schema Information
#
# Table name: users
#
#  id                       :uuid             not null, primary key
#  admin                    :boolean          default(FALSE), not null
#  is_disabled              :boolean          default(FALSE), not null
#  email                    :string           not null
#  password_digest          :string           not null
#  name                     :string
#  introduce                :text
#  image                    :string
#  cover_image              :string
#  gender                   :integer
#  undergraduate            :integer
#  department               :integer
#  twitter_link             :string
#  facebook_link            :string
#  good_evaluation_count    :integer          default(0), not null
#  neutral_evaluation_count :integer          default(0), not null
#  bad_evaluation_count     :integer          default(0), not null
#  remember_digest          :string
#  reset_digest             :string
#  reset_sent_at            :datetime
#

class User < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :like_users
  has_many :like, class_name: "Item", through: :like_users
  has_many :exhibits, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages
  has_many :chat_room_users
  has_many :chat_room,through: :chat_room_users
  has_many :notifications, dependent: :destroy
  has_many :inquiries

  validates_acceptance_of :agreement, allow_nil: false, on: :create

  attr_accessor :remember_token, :reset_token

  has_secure_password

  mount_uploader :image, ImageUploader

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def update_password_digest!
    self.update password_digest: BCrypt::Password.create(params[:session][:password], cost: cost)
  end

  def used_email?(email)
    User.find_by email: email
  end

  def is_black_list?(email)
    BlackList.find_by email: email
  end

  def sales_proceed
    self.items.where(transaction_status: 1).pluck(:price).inject(:+)
  end

  def is_exhibitor?(item)
    self == item.user
  end

  def warned_count
    self.notifications.count
  end

  def auto_delete
    if self.warned_count > 5
      BlackList.create email: self.email
      self.update(
        is_disabled: true
      )
    end
  end
end
