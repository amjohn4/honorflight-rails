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

ActiveRecord::Schema.define(version: 20150220195430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "apikey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["apikey"], name: "index_admin_users_on_apikey", unique: true, using: :btree
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "branch_id"
  end

  add_index "awards", ["branch_id"], name: "index_awards_on_branch_id", using: :btree

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medical_condition_names", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "medical_condition_type_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "medical_condition_names", ["medical_condition_type_id"], name: "index_medical_condition_names_on_medical_condition_type_id", using: :btree

  create_table "medical_condition_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.date     "diagnosed_at"
    t.date     "diagnosed_last"
    t.text     "description"
    t.integer  "person_id"
    t.integer  "medical_condition_type_id"
    t.integer  "medical_condition_name_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "medical_conditions", ["medical_condition_name_id"], name: "index_medical_conditions_on_medical_condition_name_id", using: :btree
  add_index "medical_conditions", ["medical_condition_type_id"], name: "index_medical_conditions_on_medical_condition_type_id", using: :btree
  add_index "medical_conditions", ["person_id"], name: "index_medical_conditions_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "email"
    t.string   "phone"
    t.string   "uuid"
    t.date     "birth_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "war_id"
  end

  add_index "people", ["war_id"], name: "index_people_on_war_id", using: :btree

  create_table "rank_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "rank_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ranks", ["rank_type_id"], name: "index_ranks_on_rank_type_id", using: :btree

  create_table "service_awards", force: :cascade do |t|
    t.integer  "quantity"
    t.text     "comment"
    t.integer  "service_history_id"
    t.integer  "award_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_awards", ["award_id"], name: "index_service_awards_on_award_id", using: :btree
  add_index "service_awards", ["service_history_id"], name: "index_service_awards_on_service_history_id", using: :btree

  create_table "service_histories", force: :cascade do |t|
    t.date     "start_year"
    t.date     "end_year"
    t.string   "activity"
    t.text     "story"
    t.integer  "branch_id"
    t.integer  "rank_id"
    t.integer  "rank_type_id"
    t.integer  "person_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "service_histories", ["branch_id"], name: "index_service_histories_on_branch_id", using: :btree
  add_index "service_histories", ["person_id"], name: "index_service_histories_on_person_id", using: :btree
  add_index "service_histories", ["rank_id"], name: "index_service_histories_on_rank_id", using: :btree
  add_index "service_histories", ["rank_type_id"], name: "index_service_histories_on_rank_type_id", using: :btree

  create_table "wars", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "addresses", "people"
  add_foreign_key "awards", "branches"
  add_foreign_key "medical_condition_names", "medical_condition_types"
  add_foreign_key "medical_conditions", "medical_condition_names"
  add_foreign_key "medical_conditions", "medical_condition_types"
  add_foreign_key "medical_conditions", "people"
  add_foreign_key "people", "wars"
  add_foreign_key "ranks", "rank_types"
  add_foreign_key "service_awards", "awards"
  add_foreign_key "service_awards", "service_histories"
  add_foreign_key "service_histories", "branches"
  add_foreign_key "service_histories", "people"
  add_foreign_key "service_histories", "rank_types"
  add_foreign_key "service_histories", "ranks"
end
