class Sale < ApplicationRecord
  belongs_to :corporation

  validates :year_sales, presence: true
  validates :financial_year, presence: true
end
