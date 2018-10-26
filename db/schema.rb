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

ActiveRecord::Schema.define(version: 20181026145722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "especialidads", force: :cascade do |t|
    t.text "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.text "nombre"
    t.boolean "permiso_ver"
    t.boolean "permiso_agregar"
    t.boolean "permiso_editar"
    t.boolean "disponible_paciente"
    t.text "icon"
    t.text "tab_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pathologies", force: :cascade do |t|
    t.text "idpathology"
    t.text "cie10_code"
    t.text "pathology_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "dni"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.text "nombre"
    t.text "descripcion"
    t.integer "estado"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_rols_on_menu_id"
  end

  add_foreign_key "rols", "menus"
end
