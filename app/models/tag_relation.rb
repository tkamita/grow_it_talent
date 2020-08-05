class TagRelation < ApplicationRecord

  belongs_to :corporation, optional: true
  belongs_to :applicant, optional: true
  belongs_to :tag

  
end
