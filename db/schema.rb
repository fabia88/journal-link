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

ActiveRecord::Schema.define(version: 20170821155547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["user_id"], name: "index_authors_on_user_id", using: :btree
  end

  create_table "labs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.boolean  "archived"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "creator_id"
    t.index ["creator_id"], name: "index_labs_on_creator_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_memberships_on_lab_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "paper_authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "paper_id"
    t.integer  "author_id"
    t.index ["author_id"], name: "index_paper_authors_on_author_id", using: :btree
    t.index ["paper_id"], name: "index_paper_authors_on_paper_id", using: :btree
  end

  create_table "papers", force: :cascade do |t|
    t.date     "date"
    t.string   "title"
    t.text     "abstract"
    t.string   "source"
    t.string   "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "paper_id"
    t.string   "source_url"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "paper_id"
    t.integer  "user_id"
    t.integer  "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_posts_on_lab_id", using: :btree
    t.index ["paper_id"], name: "index_posts_on_paper_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_reviews_on_paper_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.text     "search_keywords",        default: [],                 array: true
    t.text     "education"
    t.text     "job_description"
    t.text     "research_interests"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "authors", "users"
  add_foreign_key "memberships", "labs"
  add_foreign_key "memberships", "users"
  add_foreign_key "posts", "labs"
  add_foreign_key "posts", "papers"
  add_foreign_key "posts", "users"
  add_foreign_key "reviews", "papers"
  add_foreign_key "reviews", "users"
end
