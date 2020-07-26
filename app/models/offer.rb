class Offer < ApplicationRecord

  belongs_to :applicant
  belongs_to :corporation
  validates_uniqueness_of :applicant_id, scope: :corporation_id
  
end
