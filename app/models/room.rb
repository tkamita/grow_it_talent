class Room < ApplicationRecord

  belongs_to :applicant
  belongs_to :corporation
  has_many :messages, dependent: :destroy
  has_many :user_notices, dependent: :destroy
  has_many :corpo_notices, dependent: :destroy
  validates_uniqueness_of :corporation_id, scope: :applicant_id
  
end
