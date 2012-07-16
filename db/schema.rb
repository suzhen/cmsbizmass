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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120716074946) do

  create_table "article_bodies", :force => true do |t|
    t.string   "caption"
    t.string   "short_caption"
    t.text     "body"
    t.text     "formatted_html"
    t.integer  "article_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "short_title"
    t.string   "introduction"
    t.string   "author"
    t.string   "eidtor_id"
    t.string   "eidtor_name"
    t.string   "source"
    t.datetime "source_date"
    t.boolean  "published",    :default => true
    t.datetime "pubdate"
    t.boolean  "top"
    t.integer  "hits",         :default => 1
    t.string   "status",       :default => "normal"
    t.integer  "listorder"
    t.integer  "category_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "ctype"
    t.integer  "parent_id",   :default => 0
    t.string   "description"
    t.integer  "listorder",   :default => 0
    t.text     "arrparentid"
    t.text     "arrchildid"
    t.integer  "hits"
    t.string   "style"
    t.string   "path"
    t.string   "image"
    t.string   "setting"
    t.string   "status"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "enterprises", :force => true do |t|
    t.string   "name"
    t.string   "province"
    t.string   "city"
    t.string   "store_name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "tel"
    t.string   "kind"
    t.text     "remark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "magazines", :force => true do |t|
    t.string   "title"
    t.date     "public_date"
    t.string   "user_name"
    t.integer  "download"
    t.text     "remark"
    t.string   "elecpdf"
    t.string   "cover"
    t.integer  "comment_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "records", :force => true do |t|
    t.text     "body"
    t.text     "formatted_html"
    t.string   "category"
    t.string   "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "",    :null => false
    t.string   "encrypted_password",  :default => "",    :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",               :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
