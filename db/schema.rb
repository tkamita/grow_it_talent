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

ActiveRecord::Schema.define(version: 2020_07_23_055435) do

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_furigana", null: false
    t.string "first_furigana", null: false
    t.integer "gender", default: 0
    t.date "birth_date", default: "1989-01-01"
    t.string "image_id", default: ""
    t.string "postal_code", default: ""
    t.string "prefecture", default: ""
    t.string "manicipal", default: ""
    t.string "address_other", default: ""
    t.string "phone_number", default: ""
    t.integer "school_division", default: 0
    t.string "school_name", default: ""
    t.string "faculty", default: ""
    t.string "academic_decipline", default: ""
    t.string "english_skill", default: ""
    t.string "other_lang", default: ""
    t.text "overview_w_history", default: ""
    t.boolean "is_selection", default: true, null: false
    t.string "start_work", default: ""
    t.integer "work_location", default: 0
    t.integer "axis", default: 0
    t.integer "company_type", default: 0
    t.text "pg_skill", default: ""
    t.text "self_pr", default: ""
    t.text "vision", default: ""
    t.string "term_1", default: ""
    t.string "term_2", default: ""
    t.string "term_3", default: ""
    t.string "term_4", default: ""
    t.string "term_5", default: ""
    t.text "work_history_1", default: ""
    t.text "work_history_2", default: ""
    t.text "work_history_3", default: ""
    t.text "work_history_4", default: ""
    t.text "work_history_5", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture_kana", default: ""
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "pg_langs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.string "name", null: false
    t.string "acquition_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
