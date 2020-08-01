class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.integer :applicant_id, null: false
      t.string :name, null: false
      t.string :acquition_date, null: false

      t.timestamps
    end
  end
end
