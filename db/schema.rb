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

ActiveRecord::Schema.define(version: 20161129131321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "road_type"
    t.string   "road_name"
    t.string   "road_number_type"
    t.string   "road_number"
    t.string   "grader"
    t.string   "stairs"
    t.string   "floor"
    t.string   "door"
    t.string   "postal_code"
    t.string   "town"
    t.string   "province"
    t.string   "country"
    t.string   "ndp_code"
    t.string   "local_code"
    t.string   "class_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "addresses_projects", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "project_id", null: false
  end

  add_index "addresses_projects", ["address_id", "project_id"], name: "index_addresses_projects_on_address_id_and_project_id", using: :btree
  add_index "addresses_projects", ["project_id", "address_id"], name: "index_addresses_projects_on_project_id_and_address_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "areas_projects", id: false, force: :cascade do |t|
    t.integer "area_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "areas_projects", ["area_id", "project_id"], name: "index_areas_projects_on_area_id_and_project_id", using: :btree
  add_index "areas_projects", ["project_id", "area_id"], name: "index_areas_projects_on_project_id_and_area_id", using: :btree

  create_table "collectives", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "collectives_projects", id: false, force: :cascade do |t|
    t.integer "collective_id", null: false
    t.integer "project_id",    null: false
  end

  add_index "collectives_projects", ["collective_id", "project_id"], name: "index_collectives_projects_on_collective_id_and_project_id", using: :btree
  add_index "collectives_projects", ["project_id", "collective_id"], name: "index_collectives_projects_on_project_id_and_collective_id", using: :btree

  create_table "coordinations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "coordinations_projects", id: false, force: :cascade do |t|
    t.integer "coordination_id", null: false
    t.integer "project_id",      null: false
  end

  add_index "coordinations_projects", ["coordination_id", "project_id"], name: "index_coordinations_projects_on_coordination_id_and_project_id", using: :btree
  add_index "coordinations_projects", ["project_id", "coordination_id"], name: "index_coordinations_projects_on_project_id_and_coordination_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "districts_projects", id: false, force: :cascade do |t|
    t.integer "district_id", null: false
    t.integer "project_id",  null: false
  end

  add_index "districts_projects", ["district_id", "project_id"], name: "index_districts_projects_on_district_id_and_project_id", using: :btree
  add_index "districts_projects", ["project_id", "district_id"], name: "index_districts_projects_on_project_id_and_district_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "documentum_id"
    t.integer  "project_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "documents", ["project_id"], name: "index_documents_on_project_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",         default: true
    t.integer  "entity_type_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "entities", ["entity_type_id"], name: "index_entities_on_entity_type_id", using: :btree

  create_table "entity_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.binary   "payload"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.text     "comments"
    t.datetime "start_date"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "links", ["project_id"], name: "index_links_on_project_id", using: :btree

  create_table "project_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",                 default: true
    t.text     "description"
    t.string   "functions"
    t.date     "execution_start_date"
    t.date     "execution_end_date"
    t.string   "contact_name"
    t.string   "contact_first_surname"
    t.string   "contact_second_surname"
    t.string   "phone_number"
    t.string   "email"
    t.text     "comments"
    t.integer  "beneficiaries_num"
    t.integer  "volunteers_num"
    t.boolean  "insured",                default: false
    t.date     "insurance_date"
    t.integer  "project_type_id"
    t.integer  "entity_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "projects", ["entity_id"], name: "index_projects_on_entity_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree

  create_table "projects_timetables", id: false, force: :cascade do |t|
    t.integer "project_id",   null: false
    t.integer "timetable_id", null: false
  end

  add_index "projects_timetables", ["project_id", "timetable_id"], name: "index_projects_timetables_on_project_id_and_timetable_id", using: :btree
  add_index "projects_timetables", ["timetable_id", "project_id"], name: "index_projects_timetables_on_timetable_id_and_project_id", using: :btree

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pt_centres", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pt_centres", ["project_id"], name: "index_pt_centres_on_project_id", using: :btree
  add_index "pt_centres", ["project_type_id"], name: "index_pt_centres_on_project_type_id", using: :btree

  create_table "pt_entities", force: :cascade do |t|
    t.date     "request_date"
    t.text     "request_description"
    t.string   "volunteers_profile"
    t.text     "activities"
    t.date     "sav_date"
    t.integer  "derived_volunteers_num"
    t.integer  "added_volunteers_num"
    t.boolean  "agreement_signed",       default: false
    t.date     "agreement_date"
    t.boolean  "prevailing",             default: false
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "pt_entities", ["project_id"], name: "index_pt_entities_on_project_id", using: :btree
  add_index "pt_entities", ["project_type_id"], name: "index_pt_entities_on_project_type_id", using: :btree

  create_table "pt_others", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pt_others", ["project_id"], name: "index_pt_others_on_project_id", using: :btree
  add_index "pt_others", ["project_type_id"], name: "index_pt_others_on_project_type_id", using: :btree

  create_table "pt_permanents", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pt_permanents", ["project_id"], name: "index_pt_permanents_on_project_id", using: :btree
  add_index "pt_permanents", ["project_type_id"], name: "index_pt_permanents_on_project_type_id", using: :btree

  create_table "pt_punctuals", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pt_punctuals", ["project_id"], name: "index_pt_punctuals_on_project_id", using: :btree
  add_index "pt_punctuals", ["project_type_id"], name: "index_pt_punctuals_on_project_type_id", using: :btree

  create_table "pt_socials", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pt_socials", ["project_id"], name: "index_pt_socials_on_project_id", using: :btree
  add_index "pt_socials", ["project_type_id"], name: "index_pt_socials_on_project_type_id", using: :btree

  create_table "pt_subventions", force: :cascade do |t|
    t.string   "representative_name"
    t.string   "representative_first_surname"
    t.string   "representative_second_surname"
    t.string   "id_num"
    t.string   "vat_num"
    t.boolean  "entity_registry",               default: false
    t.float    "cost"
    t.float    "requested_amount"
    t.float    "subsidized_amount"
    t.integer  "initial_volunteers_num"
    t.integer  "participants_num"
    t.boolean  "has_quality_evaluation",        default: false
    t.integer  "proposal_id"
    t.integer  "project_id"
    t.integer  "project_type_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "pt_subventions", ["project_id"], name: "index_pt_subventions_on_project_id", using: :btree
  add_index "pt_subventions", ["project_type_id"], name: "index_pt_subventions_on_project_type_id", using: :btree
  add_index "pt_subventions", ["proposal_id"], name: "index_pt_subventions_on_proposal_id", using: :btree

  create_table "record_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recordable_id"
    t.string   "recordable_type"
    t.datetime "recordable_changed_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "record_histories", ["user_id"], name: "index_record_histories_on_user_id", using: :btree

  create_table "rejection_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "request_form_reasons", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "request_form_types", force: :cascade do |t|
    t.integer  "kind"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "request_forms", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.datetime "sent_at"
    t.integer  "status"
    t.datetime "status_date"
    t.integer  "rejection_type_id"
    t.text     "comments"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "request_forms", ["rejection_type_id"], name: "index_request_forms_on_rejection_type_id", using: :btree
  add_index "request_forms", ["request_form_type_id"], name: "index_request_forms_on_request_form_type_id", using: :btree

  create_table "rft_activity_publishings", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.string   "name"
    t.string   "organizer"
    t.text     "description"
    t.date     "execution_date"
    t.string   "execution_hour"
    t.string   "road_type"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "town"
    t.string   "province"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_activity_publishings", ["entity_id"], name: "index_rft_activity_publishings_on_entity_id", using: :btree
  add_index "rft_activity_publishings", ["request_form_type_id"], name: "index_rft_activity_publishings_on_request_form_type_id", using: :btree

  create_table "rft_activity_unpublishings", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_activity_unpublishings", ["entity_id"], name: "index_rft_activity_unpublishings_on_entity_id", using: :btree
  add_index "rft_activity_unpublishings", ["request_form_type_id"], name: "index_rft_activity_unpublishings_on_request_form_type_id", using: :btree

  create_table "rft_entity_subscribes", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.string   "name"
    t.string   "vat_num"
    t.string   "email"
    t.string   "contact_name"
    t.string   "contact_first_surname"
    t.string   "contact_second_surname"
    t.string   "representative_name"
    t.string   "representative_first_surname"
    t.string   "representative_second_surname"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.string   "road_type"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "town"
    t.string   "province"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "rft_entity_subscribes", ["entity_id"], name: "index_rft_entity_subscribes_on_entity_id", using: :btree
  add_index "rft_entity_subscribes", ["request_form_type_id"], name: "index_rft_entity_subscribes_on_request_form_type_id", using: :btree

  create_table "rft_entity_unsubscribes", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_entity_unsubscribes", ["entity_id"], name: "index_rft_entity_unsubscribes_on_entity_id", using: :btree
  add_index "rft_entity_unsubscribes", ["request_form_type_id"], name: "index_rft_entity_unsubscribes_on_request_form_type_id", using: :btree

  create_table "rft_others", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_others", ["entity_id"], name: "index_rft_others_on_entity_id", using: :btree
  add_index "rft_others", ["request_form_type_id"], name: "index_rft_others_on_request_form_type_id", using: :btree

  create_table "rft_project_publishings", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "description"
    t.string   "road_type"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "town"
    t.string   "province"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_project_publishings", ["entity_id"], name: "index_rft_project_publishings_on_entity_id", using: :btree
  add_index "rft_project_publishings", ["request_form_type_id"], name: "index_rft_project_publishings_on_request_form_type_id", using: :btree

  create_table "rft_project_unpublishings", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_project_unpublishings", ["entity_id"], name: "index_rft_project_unpublishings_on_entity_id", using: :btree
  add_index "rft_project_unpublishings", ["request_form_type_id"], name: "index_rft_project_unpublishings_on_request_form_type_id", using: :btree

  create_table "rft_project_unsubscribes", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.integer  "project_id"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_project_unsubscribes", ["entity_id"], name: "index_rft_project_unsubscribes_on_entity_id", using: :btree
  add_index "rft_project_unsubscribes", ["project_id"], name: "index_rft_project_unsubscribes_on_project_id", using: :btree
  add_index "rft_project_unsubscribes", ["request_form_type_id"], name: "index_rft_project_unsubscribes_on_request_form_type_id", using: :btree

  create_table "rft_volunteer_amendments", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "volunteer_id"
    t.integer  "address_id"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_volunteer_amendments", ["address_id"], name: "index_rft_volunteer_amendments_on_address_id", using: :btree
  add_index "rft_volunteer_amendments", ["request_form_type_id"], name: "index_rft_volunteer_amendments_on_request_form_type_id", using: :btree
  add_index "rft_volunteer_amendments", ["volunteer_id"], name: "index_rft_volunteer_amendments_on_volunteer_id", using: :btree

  create_table "rft_volunteer_appointments", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "volunteer_id"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_volunteer_appointments", ["request_form_type_id"], name: "index_rft_volunteer_appointments_on_request_form_type_id", using: :btree
  add_index "rft_volunteer_appointments", ["volunteer_id"], name: "index_rft_volunteer_appointments_on_volunteer_id", using: :btree

  create_table "rft_volunteer_subscribes", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.string   "name"
    t.string   "first_surname"
    t.string   "second_surname"
    t.string   "phone_number"
    t.string   "phone_number_alt"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_volunteer_subscribes", ["request_form_type_id"], name: "index_rft_volunteer_subscribes_on_request_form_type_id", using: :btree

  create_table "rft_volunteer_unsubscribes", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "volunteer_id"
    t.integer  "level"
    t.text     "reason"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rft_volunteer_unsubscribes", ["request_form_type_id"], name: "index_rft_volunteer_unsubscribes_on_request_form_type_id", using: :btree
  add_index "rft_volunteer_unsubscribes", ["volunteer_id"], name: "index_rft_volunteer_unsubscribes_on_volunteer_id", using: :btree

  create_table "rft_volunteers_demands", force: :cascade do |t|
    t.integer  "request_form_type_id"
    t.integer  "entity_id"
    t.text     "description"
    t.date     "execution_start_date"
    t.date     "execution_end_date"
    t.string   "road_type"
    t.string   "road_name"
    t.string   "number_type"
    t.string   "road_number"
    t.string   "postal_code"
    t.string   "town"
    t.string   "province"
    t.string   "requested_volunteers_num"
    t.text     "volunteers_profile"
    t.text     "volunteer_functions_1"
    t.text     "volunteer_functions_2"
    t.text     "volunteer_functions_3"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rft_volunteers_demands", ["entity_id"], name: "index_rft_volunteers_demands_on_entity_id", using: :btree
  add_index "rft_volunteers_demands", ["request_form_type_id"], name: "index_rft_volunteers_demands_on_request_form_type_id", using: :btree

  create_table "timetables", force: :cascade do |t|
    t.integer  "day"
    t.string   "start_hour"
    t.string   "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackings", force: :cascade do |t|
    t.text     "comments"
    t.datetime "start_date"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trackings", ["project_id"], name: "index_trackings_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "locale"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profileable_type", "profileable_id"], name: "index_users_on_profileable_type_and_profileable_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "first_surname"
    t.string   "second_surname"
    t.integer  "age"
    t.string   "id_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "documents", "projects"
  add_foreign_key "entities", "entity_types"
  add_foreign_key "images", "projects"
  add_foreign_key "issues", "projects"
  add_foreign_key "links", "projects"
  add_foreign_key "projects", "entities"
  add_foreign_key "projects", "project_types"
  add_foreign_key "pt_centres", "project_types"
  add_foreign_key "pt_centres", "projects"
  add_foreign_key "pt_entities", "project_types"
  add_foreign_key "pt_entities", "projects"
  add_foreign_key "pt_others", "project_types"
  add_foreign_key "pt_others", "projects"
  add_foreign_key "pt_permanents", "project_types"
  add_foreign_key "pt_permanents", "projects"
  add_foreign_key "pt_punctuals", "project_types"
  add_foreign_key "pt_punctuals", "projects"
  add_foreign_key "pt_socials", "project_types"
  add_foreign_key "pt_socials", "projects"
  add_foreign_key "pt_subventions", "project_types"
  add_foreign_key "pt_subventions", "projects"
  add_foreign_key "pt_subventions", "proposals"
  add_foreign_key "record_histories", "users"
  add_foreign_key "request_forms", "rejection_types"
  add_foreign_key "request_forms", "request_form_types"
  add_foreign_key "rft_activity_publishings", "entities"
  add_foreign_key "rft_activity_publishings", "request_form_types"
  add_foreign_key "rft_activity_unpublishings", "entities"
  add_foreign_key "rft_activity_unpublishings", "request_form_types"
  add_foreign_key "rft_entity_subscribes", "entities"
  add_foreign_key "rft_entity_subscribes", "request_form_types"
  add_foreign_key "rft_entity_unsubscribes", "entities"
  add_foreign_key "rft_entity_unsubscribes", "request_form_types"
  add_foreign_key "rft_others", "entities"
  add_foreign_key "rft_others", "request_form_types"
  add_foreign_key "rft_project_publishings", "entities"
  add_foreign_key "rft_project_publishings", "request_form_types"
  add_foreign_key "rft_project_unpublishings", "entities"
  add_foreign_key "rft_project_unpublishings", "request_form_types"
  add_foreign_key "rft_project_unsubscribes", "entities"
  add_foreign_key "rft_project_unsubscribes", "projects"
  add_foreign_key "rft_project_unsubscribes", "request_form_types"
  add_foreign_key "rft_volunteer_amendments", "addresses"
  add_foreign_key "rft_volunteer_amendments", "request_form_types"
  add_foreign_key "rft_volunteer_amendments", "volunteers"
  add_foreign_key "rft_volunteer_appointments", "request_form_types"
  add_foreign_key "rft_volunteer_appointments", "volunteers"
  add_foreign_key "rft_volunteer_subscribes", "request_form_types"
  add_foreign_key "rft_volunteer_unsubscribes", "request_form_types"
  add_foreign_key "rft_volunteer_unsubscribes", "volunteers"
  add_foreign_key "rft_volunteers_demands", "entities"
  add_foreign_key "rft_volunteers_demands", "request_form_types"
  add_foreign_key "trackings", "projects"
end
