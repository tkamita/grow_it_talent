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


      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_furigana, null: false
      t.string :first_furigana, null: false
      t.integer :gender, default: 0
      t.date :birth_date, default: Date.new(1989, 1, 1)
      t.string :image_id, default: ""
      t.string :postal_code, default: ""
      t.string :prefecture, default: ""
      t.string :manicipal, default: ""
      t.string :address_other, default: ""
      t.string :phone_number, default: ""
      t.integer :school_division, default: 0
      t.string :school_name, default: ""
      t.string :faculty, default: ""
      t.string :academic_decipline, default: ""
      t.string :english_skill, default: ""
      t.string :other_lang, default: ""
      t.text :overview_w_history
      t.boolean :is_selection, null: false, default: true
      t.string :start_work, default: ""
      t.integer :work_location, default: 0
      t.integer :axis, default: 0
      t.integer :company_type, default: 0
      t.text :pg_skill
      t.text :self_pr
      t.text :vision
      t.string :term_1, default: ""
      t.string :term_2, default: ""
      t.string :term_3, default: ""
      t.string :term_4, default: ""
      t.string :term_5, default: ""
      t.text :work_history_1
      t.text :work_history_2
      t.text :work_history_3
      t.text :work_history_4
      t.text :work_history_5

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
