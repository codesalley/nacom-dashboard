# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_29_132052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_announcements_on_department_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_departments_on_student_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "results", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "semister_id"
    t.bigint "student_id"
    t.string "basic_nursing"
    t.string "anatomy"
    t.string "midwifery"
    t.string "statictis"
    t.string "another_demo"
    t.string "last_demo_course"
    t.index ["semister_id"], name: "index_results_on_semister_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "semisters", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "index_number"
    t.string "password"
    t.string "address"
    t.date "enroll_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.string "gender"
    t.date "dob"
    t.string "email"
    t.string "phone_number"
    t.string "guardian_name"
    t.string "guardian_contact"
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  add_foreign_key "announcements", "departments"
  add_foreign_key "departments", "students"
  add_foreign_key "messages", "students"
  add_foreign_key "results", "semisters"
  add_foreign_key "results", "students"
  add_foreign_key "students", "departments"
end
