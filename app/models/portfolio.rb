class Portfolio < ApplicationRecord
  belongs_to :applicant
  belongs_to :pg_lang
  
  validates :title, presence: true
  validates :content, presence: true
  validates :link_url, presence: true
end
