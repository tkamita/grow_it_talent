# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_21_160651) do

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_furigana"
    t.string "first_furigana"
    t.boolean "is_gender"
    t.date "birth_date"
    t.string "image_id"
    t.string "postal_code"
    t.string "prefecture"
    t.string "manicipal"
    t.string "address_other"
    t.string "phone_number"
    t.integer "school_division", default: 0
    t.string "school_name"
    t.string "faculty"
    t.string "academic_decipline"
    t.string "english_skill"
    t.string "other_lang"
    t.text "overview_w_history"
    t.boolean "is_selection", default: true, null: false
    t.date "s_work_date"
    t.integer "work_location", default: 0
    t.integer "axis", default: 0
    t.integer "company_type", default: 0
    t.text "pg_skill"
    t.text "self_pr"
    t.text "vision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

end
