class CreatePgRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :pg_relations do |t|
      t.integer :applicant_id
      t.integer :pg_lang_id
      t.integer :post_id
      t.integer :portfolio_id


      t.timestamps
    end
  end
end
