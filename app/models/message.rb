class Message < ApplicationRecord

  belongs_to :room
  has_many :user_notices, dependent: :destroy
  has_many :corpo_notices, dependent: :destroy
  

  def create_notification_message(corporation_id, message_id, room_id, applicant_id)
    user_notice = user_notices.new(
      corporation_id: corporation_id,
      message_id: message_id,
      applicant_id: applicant_id,
      room_id: room_id,
      action: 'message'
    )
    # if user_notice.applicant_id == current_applicant.id
    #   user_notice.is_check = true
    # end
    user_notice.save if user_notice.valid?
  end


  def create_corpo_notice_message(corporation_id, message_id, room_id, applicant_id)
    corpo_notice = corpo_notices.new(
      corporation_id: corporation_id,
      message_id: message_id,
      applicant_id: applicant_id,
      room_id: room_id,
      action: 'message'
    )
    # if corpo_notice.corporation_id == message_id.corporation.id
    #   corpo_notice.is_check = true
    # end
    corpo_notice.save if corpo_notice.valid?
  end
end
