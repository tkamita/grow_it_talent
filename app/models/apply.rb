class Apply < ApplicationRecord

  belongs_to :applicant
  belongs_to :corporation
  validates_uniqueness_of :corporation_id, scope: :applicant_id
  
end
