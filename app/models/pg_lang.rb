class PgLang < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :portfolios, dependent: :destroy

  validates :name, presence: true
end
