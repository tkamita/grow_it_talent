class Post < ApplicationRecord
  has_many :pg_relations, dependent: :destroy
  has_many :pg_langs, through: :pg_relations, dependent: :destroy
  belongs_to :applicant

  validates :title, presence: true
  validates :content, presence: true
end
