class UserNotice < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :applicant, optional: true
  belongs_to :corporation, optional: true
  belongs_to :message, optional: true
  belongs_to :offer, optional: true
  belongs_to :room, optional: true


  def create_notification_offer(current_applicant)
    notification = current_applicant.active_notifications.new(
      applicant_id: id,
      # corporation_id: corporation_id,
      action: 'offer'
    )
    # notification.save if notification.valid?
    if notification.valid?
      notification.save
    end
  end

  # def create_notification_message(corporation_id, message_id, applicant_id)
  #   notification = current_applicant.active_notifications.new(
  #     room_id: corporation.room.id,
  #     message_id: message_id,
  #     # corporation_id: corporation_id,
  #     applicant_id: applicant_id,
  #     action: 'message'
  #   )
  #   notification.save if notification.valid?
  # end
end
