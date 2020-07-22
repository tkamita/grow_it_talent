class Qualification < ApplicationRecord
  belongs_to :applicant

  validates :name, presence: true
  validates :acquition_date, presence: true
end
