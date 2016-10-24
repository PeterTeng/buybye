class  Notification < ApplicationRecord
  belongs_to :user

  NOTIFICATION_STATUS_HASH = { "警告" => 0, "削除通知" => 1}

  enum status: Notification::NOTIFICATION_STATUS_HASH
end
