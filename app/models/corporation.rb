class Corporation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offered_applicant, through: :offers, source: :applicant
  has_many :applies, dependent: :destroy
  has_many :applied_applicants, through: :applies, source: :applicant

  def already_offered?(applicant)
    self.offers.exists?(applicant_id: applicant.id)
  end
end
