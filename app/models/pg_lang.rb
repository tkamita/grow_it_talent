class PgLang < ApplicationRecord
  has_many :pg_relations, dependent: :destroy
  has_many :posts, through: :pg_relations, dependent: :destroy
  has_many :portfolios, through: :pg_relations, dependent: :destroy
  has_many :applicants, through: :pg_relations, dependent: :destroy
  

  validates :name, presence: true
end
