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

ActiveRecord::Schema.define(version: 2020_08_03_103840) do

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

  create_table "applies", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "corporation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corpo_notices", force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "applicant_id", null: false
    t.integer "room_id"
    t.integer "message_id"
    t.integer "apply_id"
    t.string "action", default: "", null: false
    t.boolean "is_check", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_corpo_notices_on_applicant_id"
    t.index ["apply_id"], name: "index_corpo_notices_on_apply_id"
    t.index ["corporation_id"], name: "index_corpo_notices_on_corporation_id"
    t.index ["message_id"], name: "index_corpo_notices_on_message_id"
  end

  create_table "corporations", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "president_name", default: ""
    t.date "establish_day", default: "2000-01-01"
    t.integer "quantity_emp", default: 1
    t.integer "capital_stock", default: 0
    t.string "title", default: ""
    t.string "location", default: ""
    t.text "content"
    t.boolean "is_stock", default: false, null: false
    t.text "business_description"
    t.text "place_info"
    t.text "require_competence"
    t.string "work_location", default: ""
    t.boolean "is_emp_status", default: true, null: false
    t.integer "salary", default: 300
    t.string "working_hour", default: ""
    t.boolean "is_overtime", default: false, null: false
    t.boolean "is_overtime_pay", default: true, null: false
    t.text "commute_allowance"
    t.string "day_off", default: ""
    t.string "paid_vacation", default: ""
    t.boolean "is_health_insurance", default: true, null: false
    t.boolean "is_welfare_pension", default: true, null: false
    t.boolean "is_emp_insurance", default: true, null: false
    t.boolean "is_accident_insurance", default: true, null: false
    t.boolean "is_dwelling", default: false, null: false
    t.boolean "is_retire_payment", default: false, null: false
    t.text "other_welfare"
    t.integer "recruit_number", default: 1
    t.integer "interview_number", default: 1
    t.text "company_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_corporations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_corporations_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_corporation", default: true
  end

  create_table "offers", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "corporation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_langs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pg_langs_on_name"
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "pg_lang_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.string "theme"
    t.text "reason"
    t.string "target"
    t.string "scene"
    t.text "link_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "pg_lang_id", null: false
    t.string "title", null: false
    t.text "content", null: false
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

  create_table "rooms", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "corporation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "year_sales", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "financial_year", default: "", null: false
  end

  create_table "tag_relations", force: :cascade do |t|
    t.integer "corporation_id"
    t.integer "applicant_id"
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_notices", force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "applicant_id", null: false
    t.integer "message_id"
    t.integer "offer_id"
    t.string "action", default: "", null: false
    t.boolean "is_check", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["applicant_id"], name: "index_user_notices_on_applicant_id"
    t.index ["corporation_id"], name: "index_user_notices_on_corporation_id"
    t.index ["message_id"], name: "index_user_notices_on_message_id"
    t.index ["offer_id"], name: "index_user_notices_on_offer_id"
  end

end
