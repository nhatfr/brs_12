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

ActiveRecord::Schema.define(version: 20150601082924) do

  create_table "activities", force: :cascade do |t|
    t.integer  "action"
    t.integer  "target_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "book_users", force: :cascade do |t|
    t.string   "status"
    t.boolean  "favorite"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_users", ["book_id"], name: "index_book_users_on_book_id"
  add_index "book_users", ["user_id"], name: "index_book_users_on_user_id"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.datetime "publication_date"
    t.string   "author"
    t.integer  "number_of_pages"
    t.float    "rating"
    t.string   "ISBN"
    t.string   "description"
    t.string   "picture"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "like_unlikes", force: :cascade do |t|
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "like_unlikes", ["activity_id"], name: "index_like_unlikes_on_activity_id"
  add_index "like_unlikes", ["user_id"], name: "index_like_unlikes_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "followed_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "requests", force: :cascade do |t|
    t.string   "book_name"
    t.string   "description"
    t.string   "author"
    t.string   "ISBN"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.float    "rating"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
