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

class Purchase < Item
  belongs_to :user
end
