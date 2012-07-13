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

ActiveRecord::Schema.define(:version => 20120713152709) do

  create_table "animals", :force => true do |t|
    t.string   "ac_id"
    t.string   "species"
    t.string   "sex"
    t.string   "age"
    t.string   "breed"
    t.date     "arrival_date"
    t.date     "release_date"
    t.date     "final_date"
    t.string   "adoptable"
    t.string   "location"
    t.text     "description"
    t.string   "pic_file_name"
    t.integer  "pic_file_size"
    t.string   "pic_content_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "contacts", :force => true do |t|
    t.integer  "department_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "title"
    t.string   "email"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.integer  "position"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "dept_name"
    t.string   "dept_hours"
    t.string   "dept_phone"
    t.string   "dept_fax"
    t.string   "dept_email"
    t.string   "dept_location"
    t.string   "dept_mailing"
    t.string   "pic_file_name"
    t.integer  "pic_file_size"
    t.string   "pic_content_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "description"
  end

  create_table "departments_resources", :id => false, :force => true do |t|
    t.integer "department_id"
    t.integer "resource_id"
  end

  create_table "departments_users", :id => false, :force => true do |t|
    t.integer "department_id"
    t.integer "user_id"
  end

  create_table "events", :force => true do |t|
    t.string   "event_type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title"
    t.text     "blurb"
    t.text     "description"
    t.string   "url"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "faq_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faq_categories_faqs", :id => false, :force => true do |t|
    t.integer "faq_category_id"
    t.integer "faq_id"
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.string   "url"
    t.boolean  "featured"
    t.integer  "position"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "rescats", :force => true do |t|
    t.string   "category"
    t.text     "blurb"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rescats_resources", :id => false, :force => true do |t|
    t.integer "rescat_id"
    t.integer "resource_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "resource_type"
    t.string   "title"
    t.text     "description"
    t.string   "res_file_name"
    t.integer  "res_file_size"
    t.string   "res_content_type"
    t.boolean  "featured"
    t.integer  "position"
    t.integer  "department_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "showcase_images", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.integer  "position"
    t.text     "caption"
    t.integer  "showcase_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "showcase_medias", :force => true do |t|
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.text     "caption"
    t.integer  "showcase_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "showcases", :force => true do |t|
    t.string   "title"
    t.boolean  "published"
    t.datetime "publish_date"
    t.text     "blurb"
    t.text     "article"
    t.text     "sidebar"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                             :null => false
    t.string   "name",                              :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "admin_level",        :default => 5
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
