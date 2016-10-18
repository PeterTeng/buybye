# == Schema Information
#
# Table name: item_images
#
#  id      :uuid             not null, primary key
#  item_id :uuid             not null
#  image   :string           not null
#

class ItemImage  < ApplicationRecord
  belongs_to :item
end
