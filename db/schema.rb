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

ActiveRecord::Schema.define(version: 20160405122708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "influencer_id"
    t.text     "motivation"
    t.string   "status"
    t.integer  "pic_likes"
    t.integer  "pic_comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photo"
  end

  add_index "applications", ["campaign_id"], name: "index_applications_on_campaign_id", using: :btree
  add_index "applications", ["influencer_id"], name: "index_applications_on_influencer_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "category"
    t.string   "tva"
    t.string   "contact_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "reward_type"
    t.string   "target_location"
    t.string   "title"
    t.string   "product"
    t.string   "goal"
    t.string   "start_time"
    t.string   "end_time"
    t.text     "description"
    t.text     "instructions"
    t.integer  "pics_to_upload"
    t.integer  "pics_to_post"
    t.integer  "budget"
    t.integer  "business_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "campaigns", ["business_id"], name: "index_campaigns_on_business_id", using: :btree

  create_table "influencers", force: :cascade do |t|
    t.string   "username"
    t.integer  "followers"
    t.integer  "avg_photo_comments"
    t.integer  "avg_photo_likes"
    t.string   "top_hashtags"
    t.string   "top_places"
    t.string   "address"
    t.string   "number"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo"
  end

  add_index "influencers", ["user_id"], name: "index_influencers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "applications", "campaigns"
  add_foreign_key "applications", "influencers"
  add_foreign_key "businesses", "users"
  add_foreign_key "campaigns", "businesses"
  add_foreign_key "influencers", "users"
end
