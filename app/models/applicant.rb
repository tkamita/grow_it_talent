class Applicant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
         # image_idかも
  mount_uploader :image_id, ImageUploader

  has_many :qualifications, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offered_corporations, through: :offers, source: :corporation
  has_many :applies, dependent: :destroy
  has_many :applied_corporations, through: :applies, source: :corporation
  has_many :rooms, dependent: :destroy
  has_many :room_corporations, through: :rooms, source: :corporation
  has_many :user_notices, dependent: :destroy
  has_many :corpo_notices, dependent: :destroy
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email, presence: true, uniqueness: true

  def already_applied?(corporation)
    self.applies.exists?(corporation_id: corporation.id)
  end

  def already_room?(corporation)
    self.rooms.exists?(corporation_id: corporation.id)
  end

  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_furigana + " " + first_furigana
  end

  def unchecked_user_notices
    self.user_notices.where(is_check: false)
  end
  

  enum gender:{
    "選択して下さい": 0,
    "男性": 1,
    "女性": 2
  }
  enum school_division:{
    "最終学歴を選んでください": 0,
    "中学": 1,
    "高校": 2,
    "高専": 3,
    "短大": 4,
    "大学": 5,
    "専門": 6
  }
  enum work_location:{
    "東京都":0,"東京23区":1,"北海道":2,"青森県":3,"岩手県":4,"宮城県":5,"秋田県":6,"山形県":7,"福島県":8,"茨城県":9,"栃木県":10,
    "群馬県":11,"埼玉県":12,"千葉県":13,"神奈川県":14,"新潟県":15,"富山県":16,"石川県":17,"福井県":18,"山梨県":19,"長野県":20,"岐阜県":21,"静岡県":22,"愛知県":23,
    "三重県":24,"滋賀県":25,"京都府":26,"大阪府":27,"兵庫県":28,"奈良県":29,"和歌山県":30,"鳥取県":31,"島根県":32,"岡山県":33,"広島県":34,"山口県":35,"徳島県":36,
    "香川県":37,"愛媛県":38,"高知県":39,"福岡県":40,"佐賀県":41,"長崎県":42,"熊本県":43,"大分県":44,"宮崎県":45,"鹿児島県":46,"沖縄県":47
  }
  enum axis:{
    "まだ決まっていない":0,
    "事業の成長性の高さ":1,
    "育児・介護休暇制度の活用実績":2,
    "学んできた言語を活かせる環境":3,
    "給与水準や昇給率の高さ":4,
    "住宅補助など給与以外の制度の充実":5,
    "堅実な事業":6,
    "フレックス制度の導入":7,
    "有給消化率の高さ":8,
    "残業時間の少なさ":9,
    "長期的に継続している事業":10,
    "２０代から責任ある仕事を任せる環境":11,
    "先鋭的な技術・サービス":12,
    "整った育成環境":13,
    "業界シェアの高さ":14,
    "既存業界に対する新しいアプローチ":15,
    "海外駐在の機会":16,
    "服装や働き方が自由な環境":17,
    "リモートワーク可能な環境":18
  }
  enum company_type:{
    "希望はない":0,
    "大手老舗":1,
    "中小老舗":2,
    "メガベンチャー":3,
    "ベンチャー":4
  }

  scope :search, -> (search_params) do
    return if search_params.blank?
    gender_is(search_params[:gender]).
    school_is(search_params[:school_division]).
    selection_is(search_params[:is_selection]).
    location_is(search_params[:work_location]).
    axis_is(search_params[:axis]).
    company_is(search_params[:company_type])
  end

  scope :gender_is, -> (gender) { where(gender: gender) if gender.present? }
  scope :school_is, -> (school_division) { where(school_division: school_division) if school_division.present? }
  scope :selection_is, -> (is_selection) { where(is_selection: is_selection) if is_selection.present? }
  scope :location_is, -> (work_location) { where(work_location: work_location) if work_location.present? }
  scope :axis_is, -> (axis) { where(axis: axis) if axis.present? }
  scope :company_is, -> (company_type) { where(company_type: company_type) if company_type.present? }

end