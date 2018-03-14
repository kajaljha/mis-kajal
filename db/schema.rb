# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160227115621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_skill_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "course_name"
    t.string   "university_name"
    t.date     "year_of_passing"
    t.float    "percentage"
    t.string   "board"
    t.string   "name"
    t.string   "skill_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bank_and_identity_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bank_account_no", limit: 8
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "city"
    t.string   "ifsc_code"
    t.string   "pancard_no"
    t.string   "passport_no"
    t.string   "uid_no"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "bdes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sales_id"
    t.integer  "skype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_assigned_resources", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "company_name"
    t.string   "location"
    t.string   "designation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sales_id"
  end

  create_table "client_basic_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_contact_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "skype_id"
    t.string   "personal_email_id"
    t.string   "official_email_id"
    t.integer  "phone_no",          limit: 8
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "client_payment_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "payment_mode"
    t.float    "payment_amount"
    t.datetime "payment_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "sales_id"
  end

  create_table "client_project_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "project_name"
    t.text     "description"
    t.string   "technologies"
    t.date     "project_start_date"
    t.date     "estimated_end_date"
    t.string   "project_type"
    t.text     "currency_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "employee_id"
    t.integer  "sales_id"
  end

  create_table "employee_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "emp_id"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.date     "doj"
    t.string   "blood_group"
    t.string   "designation"
    t.string   "oficial_email_id"
    t.integer  "mobile",             limit: 8
    t.integer  "landline",           limit: 8
    t.text     "current_address"
    t.text     "permanent_address"
    t.string   "skype_id"
    t.string   "personal_email_id"
    t.string   "guardian_full_name"
    t.integer  "guardian_mobile",    limit: 8
    t.integer  "guardian_landline",  limit: 8
    t.text     "guardian_address"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "feedback"
    t.integer  "punctuality"
    t.integer  "communication"
    t.integer  "behavior"
    t.integer  "meet_to_deadline"
    t.integer  "daily_reporting"
    t.integer  "problem_solving"
    t.integer  "research_capabilities"
    t.integer  "self_motivated"
    t.integer  "understanding_of_tasks"
    t.integer  "working_in_a_team"
    t.integer  "overall_rating"
    t.string   "remark"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_project_detail_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "availability"
    t.string   "currently_working_on"
    t.string   "sales_email_id"
    t.string   "leave_type"
    t.date     "leave_from_date"
    t.date     "leave_to_date"
    t.text     "reason"
    t.text     "comment"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "status"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "item"
    t.text     "description"
    t.integer  "unit_cost"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "invoice_date"
    t.string   "invoice_number"
    t.string   "bill_to"
    t.string   "currency"
    t.date     "due_date"
    t.text     "note"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "status",                   default: false
    t.integer  "tax"
    t.integer  "discount"
    t.integer  "client_project_detail_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "availability"
    t.string   "currently_working_on"
    t.string   "sales_email_id"
    t.string   "leave_type"
    t.date     "leave_from_date"
    t.date     "leave_to_date"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "remark"
    t.date     "published_at"
    t.string   "published_by"
  end

  create_table "previous_comp_details", force: :cascade do |t|
    t.string   "company_name"
    t.string   "location"
    t.string   "designation"
    t.datetime "from_month_year"
    t.datetime "to_month_year"
    t.float    "last_ctc"
    t.string   "leave_reason"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "project_details", force: :cascade do |t|
    t.string   "project_name"
    t.string   "you_role"
    t.string   "project_url"
    t.date     "project_duration"
    t.text     "project_desc"
    t.string   "technical_stack"
    t.string   "client_name"
    t.string   "comp_name"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "read_marks", force: :cascade do |t|
    t.integer  "readable_id"
    t.string   "readable_type", null: false
    t.integer  "reader_id"
    t.string   "reader_type",   null: false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", using: :btree

  create_table "salary_details", force: :cascade do |t|
    t.string   "user_type"
    t.float    "ctc"
    t.float    "training_salary"
    t.float    "probation_salary"
    t.float    "confirmed_salary"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sales_bdes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "commission"
    t.integer  "contact",         limit: 8
    t.string   "skype_id"
    t.string   "email_id"
    t.string   "location"
    t.text     "address"
    t.integer  "bank_account_no"
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "ifsc_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sales_consultants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "commission"
    t.integer  "contact",         limit: 8
    t.string   "skype_id"
    t.string   "email_id"
    t.string   "location"
    t.text     "address"
    t.integer  "bank_account_no", limit: 8
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "ifsc_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "role"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "creators_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
