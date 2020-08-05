class CreateTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relations do |t|
      t.integer :corporation_id
      t.integer :applicant_id
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
