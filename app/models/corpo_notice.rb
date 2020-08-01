class CorpoNotice < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :applicant
  belongs_to :corporation
  belongs_to :message, optional: true
  belongs_to :apply, optional: true
  belongs_to :room, optional: true
  
  def unchecked_corpo_notices
    self.corpo_notices.where(is_check: false)
  end
end
