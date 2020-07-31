class Message < ApplicationRecord

  belongs_to :room
  has_many :user_notices, dependent: :destroy
  

  def create_notification_message(corporation_id, message_id, room_id, applicant_id)
    notification = user_notices.new(
      corporation_id: corporation_id,
      message_id: message_id,
      # corporation_id: corporation_id,
      applicant_id: applicant_id,
      room_id: room_id,
      action: 'message'
    )
    notification.save if notification.valid?
  end
end
