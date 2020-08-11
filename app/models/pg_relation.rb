class PgRelation < ApplicationRecord
  belongs_to :applicant, optional: true
  belongs_to :post, optional: true
  belongs_to :portfolio, optional: true
  belongs_to :pg_lang
  
end
