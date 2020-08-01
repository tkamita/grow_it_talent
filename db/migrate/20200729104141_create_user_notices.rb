class CreateUserNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notices do |t|
      t.integer :corporation_id, null: false
      t.integer :applicant_id, null: false
      t.integer :message_id
      t.integer :offer_id
      t.string  :action, default: "", null: false
      t.boolean :is_check, default: false, null: false

      t.timestamps
    end

    add_index :user_notices, :applicant_id
    add_index :user_notices, :corporation_id
    add_index :user_notices, :message_id
    add_index :user_notices, :offer_id
  end
end
