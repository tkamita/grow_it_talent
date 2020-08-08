# frozen_string_literal: true

class DeviseCreateCorporations < ActiveRecord::Migration[5.2]
  def change
    create_table :corporations do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.string :name, null: false
      t.string :president_name, default: ""
      t.date :establish_day, default: Date.new(2000, 1, 1)
      t.integer :quantity_emp, default: 1
      t.integer :capital_stock, default: 0
      t.string :title, default: ""
      t.string :location, default: ""
      t.text :content
      t.boolean :is_stock, null: false, default: false
      t.text :business_description
      t.text :place_info
      t.text :require_competence
      t.string :work_location, default: ""
      t.boolean :is_emp_status, null: false, default: true
      t.integer :salary, default: 300
      t.string :working_hour, default: ""
      t.boolean :is_overtime, null: false, default: false
      t.boolean :is_overtime_pay, null: false, default: true
      t.text :commute_allowance
      t.string :day_off, default: ""
      t.string :paid_vacation, default: ""
      t.boolean :is_health_insurance, null: false, default: true
      t.boolean :is_welfare_pension, null: false, default: true
      t.boolean :is_emp_insurance, null: false, default: true
      t.boolean :is_accident_insurance, null: false, default: true
      t.boolean :is_dwelling, null: false, default: false
      t.boolean :is_retire_payment, null: false, default: false
      t.text :other_welfare
      t.integer :recruit_number, default: 1
      t.integer :interview_number, default: 1
      t.text :company_url

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

    add_index :corporations, :email,                unique: true
    add_index :corporations, :reset_password_token, unique: true
    # add_index :corporations, :confirmation_token,   unique: true
    # add_index :corporations, :unlock_token,         unique: true
  end
end
