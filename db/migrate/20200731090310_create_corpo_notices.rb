class CreateCorpoNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :corpo_notices do |t|
      t.integer :corporation_id, null: false
      t.integer :applicant_id, null: false
      t.integer :room_id
      t.integer :message_id
      t.integer :apply_id
      t.string  :action, default: "", null: false
      t.boolean :is_check, default: false, null: false
      
      t.timestamps
    end

    add_index :corpo_notices, :corporation_id
    add_index :corpo_notices, :applicant_id
    add_index :corpo_notices, :message_id
    add_index :corpo_notices, :apply_id
  end
end
