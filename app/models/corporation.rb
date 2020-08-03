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
  has_many :rooms, dependent: :destroy
  has_many :room_applicants, through: :rooms, source: :applicant
  has_many :user_notices, dependent: :destroy
  has_many :corpo_notices, dependent: :destroy
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations, dependent: :destroy

  def already_offered?(applicant)
    self.offers.exists?(applicant_id: applicant.id)
  end

  def already_room?(applicant)
    self.rooms.exists?(applicant_id: applicant.id)
  end

  def unchecked_corpo_notices
    self.corpo_notices.where(is_check: false)
  end
end
