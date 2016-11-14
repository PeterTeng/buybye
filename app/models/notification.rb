# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :uuid             not null
#  status     :integer          not null
#  is_read    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class  Notification < ApplicationRecord
  belongs_to :user

  NOTIFICATION_STATUS_HASH = { "警告" => 0, "削除通知" => 1}

  enum status: Notification::NOTIFICATION_STATUS_HASH
end
