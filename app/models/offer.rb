class Offer < ApplicationRecord

  belongs_to :applicant
  belongs_to :corporation
  has_many :user_notices, dependent: :destroy
  validates_uniqueness_of :applicant_id, scope: :corporation_id
  

  def create_notification_offer(corporation_id, offer_id, applicant_id)
    notification = user_notices.new(
      corporation_id: corporation_id,
      offer_id: offer_id,
      applicant_id: applicant_id,
      action: 'offer'
    )
    notification.save if notification.valid?
  end
end
