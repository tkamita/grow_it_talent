class Tag < ApplicationRecord

  has_many :tag_relations, dependent: :destroy
  has_many :corporations, through: :tag_relations, dependent: :destroy
  has_many :applicants, through: :tag_relations, dependent: :destroy
  
end
