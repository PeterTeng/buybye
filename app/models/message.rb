# == Schema Information
#
# Table name: messages
#
#  id      :uuid             not null, primary key
#  content :text             not null
#  is_read :boolean          default(FALSE), not null
#

class Message < ApplicationRecord
  belongs_to :user
end
