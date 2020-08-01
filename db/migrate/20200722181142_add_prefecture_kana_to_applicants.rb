class AddPrefectureKanaToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :prefecture_kana, :string, default: ""
  end
end
