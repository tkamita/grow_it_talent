class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :applicant_id, null: false
      t.integer :pg_lang_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :theme
      t.text :reason
      t.string :target
      t.string :scene
      t.text :link_url, null: false

      t.timestamps
    end
  end
end
