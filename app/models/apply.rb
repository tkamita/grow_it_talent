class Apply < ApplicationRecord

  belongs_to :applicant
  belongs_to :corporation
  has_many :corpo_notices, dependent: :destroy
  validates_uniqueness_of :corporation_id, scope: :applicant_id
  
  def create_corpo_notice_apply(corporation_id, apply_id, applicant_id)
    corpo_notice = corpo_notices.new(
      corporation_id: corporation_id,
      apply_id: apply_id,
      applicant_id: applicant_id,
      action: 'apply'
    )
    corpo_notice.save if corpo_notice.valid?
  end
end
