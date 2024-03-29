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

ActiveRecord::Schema.define(:version => 20121027125927) do

  create_table "ad_spaces", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "kind"
    t.string   "path"
    t.integer  "width"
    t.integer  "height"
    t.string   "setting"
    t.string   "description"
    t.integer  "items"
    t.boolean  "disabled",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "ads", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "setting"
    t.date     "startdate",   :default => '2012-09-04'
    t.date     "enddate"
    t.integer  "hits"
    t.integer  "clicks",      :default => 0
    t.integer  "listorder",   :default => 0
    t.boolean  "disabled"
    t.string   "poster"
    t.integer  "ad_space_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "url"
  end

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
    t.text     "introduction"
    t.string   "author"
    t.string   "eidtor_id"
    t.string   "eidtor_name"
    t.string   "source"
    t.datetime "source_date"
    t.boolean  "published",     :default => true
    t.datetime "pubdate"
    t.boolean  "top"
    t.integer  "hits",          :default => 1
    t.string   "status",        :default => "normal"
    t.integer  "listorder"
    t.integer  "category_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "theme_picture"
  end

  create_table "biz_companies", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url"
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
    t.string   "ename"
  end

  create_table "employing_units", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "linkman"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "formatted_html"
    t.text     "body"
    t.string   "logo"
    t.boolean  "showprimary"
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

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "local"
    t.string   "price"
    t.string   "kind"
    t.string   "logo"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.integer  "people"
    t.string   "place"
    t.integer  "employing_unit_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "body"
    t.text     "formatted_html"
  end

  create_table "links", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "logo"
    t.string   "description"
    t.string   "user_name"
    t.integer  "listorder"
    t.boolean  "disabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "body_title"
    t.text     "body"
    t.integer  "listorder",   :default => 0
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "fax"
    t.string   "address"
    t.string   "web"
    t.string   "position"
    t.string   "logo"
    t.boolean  "showprimary", :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pic_spaces", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.integer  "maxnum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.string   "style"
    t.text     "description"
    t.integer  "listorder"
    t.string   "status"
    t.string   "user_name"
    t.string   "url"
    t.integer  "article_id"
    t.integer  "category_id"
    t.integer  "pic_space_id"
    t.string   "picture"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "property_management_companies", :force => true do |t|
    t.string   "name"
    t.string   "local"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "records", :force => true do |t|
    t.text     "body"
    t.text     "formatted_html"
    t.string   "category"
    t.string   "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "resumes", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "birth"
    t.string   "credential"
    t.string   "phone"
    t.string   "email"
    t.text     "evaluation"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "formatted_html"
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

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "editor"
    t.integer  "hits"
    t.text     "body"
    t.string   "thumb"
    t.boolean  "showprimary"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "source"
  end

end
