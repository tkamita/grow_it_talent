class Portfolio < ApplicationRecord
  has_many :pg_relations, dependent: :destroy
  has_many :pg_langs, through: :pg_relations, dependent: :destroy
  belongs_to :applicant
  
  validates :title, presence: true
  validates :content, presence: true
  validates :link_url, presence: true
end
