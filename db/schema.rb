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

ActiveRecord::Schema.define(version: 20181101001920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cita", force: :cascade do |t|
    t.datetime "fecha_registro"
    t.bigint "horario_id"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estado"
    t.index ["horario_id"], name: "index_cita_on_horario_id"
    t.index ["usuario_id"], name: "index_cita_on_usuario_id"
  end

  create_table "especialidads", force: :cascade do |t|
    t.text "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historia_clinicas", force: :cascade do |t|
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_historia_clinicas_on_usuario_id"
  end

  create_table "horarios", force: :cascade do |t|
    t.text "horario"
    t.text "dia"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_horarios_on_usuario_id"
  end

  create_table "medicamentos", force: :cascade do |t|
    t.text "codigo_drug_bank"
    t.text "nombre"
    t.text "forma_farmaceutica"
    t.text "nombre_algoritmo"
    t.integer "estado_algoritmo"
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
    t.integer "orden"
    t.boolean "disponible_admin"
    t.boolean "disponible_medico"
    t.boolean "disponible_recepcionista"
    t.boolean "disponible_enfermero"
  end

  create_table "patologia", force: :cascade do |t|
    t.text "codigo_cie"
    t.text "nombre"
    t.text "descripcion"
    t.text "nombre_algoritmo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "dni"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registro_consulta", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "anamnesis"
    t.text "descripcion_examen_fisico"
    t.text "resultado_examen"
    t.bigint "citum_id"
    t.bigint "historia_clinica_id"
    t.index ["citum_id"], name: "index_registro_consulta_on_citum_id"
    t.index ["historia_clinica_id"], name: "index_registro_consulta_on_historia_clinica_id"
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

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "nombres"
    t.text "apellidos"
    t.text "dni"
    t.datetime "fecha_nacimiento"
    t.text "genero"
    t.integer "estado"
    t.text "telefono"
    t.text "colegiatura"
    t.integer "categoria"
    t.text "direccion"
    t.bigint "especialidad_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["especialidad_id"], name: "index_usuarios_on_especialidad_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "cita", "horarios"
  add_foreign_key "cita", "usuarios"
  add_foreign_key "historia_clinicas", "usuarios"
  add_foreign_key "horarios", "usuarios"
  add_foreign_key "registro_consulta", "cita"
  add_foreign_key "registro_consulta", "historia_clinicas"
  add_foreign_key "rols", "menus"
  add_foreign_key "usuarios", "especialidads"
end
