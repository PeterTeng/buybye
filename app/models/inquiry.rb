# == Schema Information
#
# Table name: inquiries
#
#  id              :integer          not null, primary key
#  is_acknowledged :boolean          default(FALSE), not null
#  user_id         :uuid             not null
#  title           :string
#  content         :text             not null
#  nickname        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Inquiry < ApplicationRecord
  belongs_to :user
end
