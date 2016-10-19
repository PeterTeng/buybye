# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  admin           :boolean          default(FALSE), not null
#  email           :string           not null
#  password_digest :string           not null
#  name            :string
#  introduce       :text
#  image           :string
#  cover_image     :string
#  gender          :integer
#  undergraduate   :integer
#  department      :integer
#  favorites       :uuid             is an Array
#  twitter_link    :string
#  facebook_link   :string
#  remember_digest :string
#  reset_digest    :string
#  reset_sent_at   :datetime
#

class User < ApplicationRecord
  has_many :items
  has_many :exhibits
  has_many :purchases
  has_many :comments
  has_many :favorites
  has_many :chat_room,through: :chat_room_users

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

  def sales_proceed
    self.exhibits.where(transaction_status: 1).pluck(:price).inject(:+)
  end

  def is_exhibitor?(comment)
  end
end
