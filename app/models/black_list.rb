# == Schema Information
#
# Table name: black_lists
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlackList < ApplicationRecord
end
