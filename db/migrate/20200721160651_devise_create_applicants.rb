# frozen_string_literal: true

class DeviseCreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at


      t.string :last_name
      t.string :first_name
      t.string :last_furigana
      t.string :first_furigana
      t.boolean :is_gender
      t.date :birth_date
      t.string :image_id
      t.string :postal_code
      t.string :prefecture
      t.string :manicipal
      t.string :address_other
      t.string :phone_number
      t.integer :school_division, default: 0
      t.string :school_name
      t.string :faculty
      t.string :academic_decipline
      t.string :english_skill
      t.string :other_lang
      t.text :overview_w_history
      t.boolean :is_selection, null: false, default: true
      t.date :s_work_date
      t.integer :work_location, default: 0
      t.integer :axis, default: 0
      t.integer :company_type, default: 0
      t.text :pg_skill
      t.text :self_pr
      t.text :vision



      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :applicants, :email,                unique: true
    add_index :applicants, :reset_password_token, unique: true
    # add_index :applicants, :confirmation_token,   unique: true
    # add_index :applicants, :unlock_token,         unique: true
  end
end
