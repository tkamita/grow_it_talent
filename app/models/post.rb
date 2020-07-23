class Post < ApplicationRecord
  belongs_to :pg_lang
  belongs_to :applicant

  validates :title, presence: true
  validates :content, presence: true
end
