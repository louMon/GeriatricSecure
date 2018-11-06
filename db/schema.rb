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

ActiveRecord::Schema.define(version: 20181106234009) do

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

  create_table "concentracion_x_medicamentos", force: :cascade do |t|
    t.bigint "medicamento_id"
    t.bigint "concentracion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concentracion_id"], name: "index_concentracion_x_medicamentos_on_concentracion_id"
    t.index ["medicamento_id"], name: "index_concentracion_x_medicamentos_on_medicamento_id"
  end

  create_table "concentracions", force: :cascade do |t|
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostico_x_registro_consulta", force: :cascade do |t|
    t.bigint "registro_consultum_id"
    t.bigint "patologium_id"
    t.decimal "peso_patologia"
    t.boolean "es_cronica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patologium_id"], name: "index_diagnostico_x_registro_consulta_on_patologium_id"
    t.index ["registro_consultum_id"], name: "index_diagnostico_x_registro_consulta_on_registro_consultum_id"
  end

  create_table "efecto_secundarios", force: :cascade do |t|
    t.bigint "medicamento_id"
    t.decimal "probabilidad_efecto"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_efecto_secundarios_on_medicamento_id"
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

  create_table "medicamento_x_patologia", force: :cascade do |t|
    t.decimal "probabilidad_efectividad"
    t.bigint "patologium_id"
    t.bigint "medicamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_medicamento_x_patologia_on_medicamento_id"
    t.index ["patologium_id"], name: "index_medicamento_x_patologia_on_patologium_id"
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
    t.bigint "rol_id"
    t.index ["rol_id"], name: "index_menus_on_rol_id"
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

  create_table "prescripcions", force: :cascade do |t|
    t.bigint "concentracion_id"
    t.text "via_administracion"
    t.integer "cantidad_farmacos"
    t.bigint "recetum_id"
    t.text "dosis"
    t.bigint "concentracion_x_medicamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concentracion_id"], name: "index_prescripcions_on_concentracion_id"
    t.index ["concentracion_x_medicamento_id"], name: "index_prescripcions_on_concentracion_x_medicamento_id"
    t.index ["recetum_id"], name: "index_prescripcions_on_recetum_id"
  end

  create_table "receta", force: :cascade do |t|
    t.bigint "citum_id"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citum_id"], name: "index_receta_on_citum_id"
  end

  create_table "registro_consulta", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "anamnesis"
    t.text "descripcion_examen_fisico"
    t.text "resultado_examen"
    t.bigint "citum_id"
    t.index ["citum_id"], name: "index_registro_consulta_on_citum_id"
  end

  create_table "rols", force: :cascade do |t|
    t.text "nombre"
    t.text "descripcion"
    t.integer "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signos_vitals", force: :cascade do |t|
    t.bigint "registro_consultum_id"
    t.decimal "talla"
    t.decimal "peso"
    t.integer "nivel_presion_sistolica"
    t.integer "nivel_presion_diastolica"
    t.text "nivel_azucar"
    t.decimal "temperatura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "presion_arterial"
    t.index ["registro_consultum_id"], name: "index_signos_vitals_on_registro_consultum_id"
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
    t.bigint "rol_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["especialidad_id"], name: "index_usuarios_on_especialidad_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["rol_id"], name: "index_usuarios_on_rol_id"
  end

  add_foreign_key "cita", "horarios"
  add_foreign_key "cita", "usuarios"
  add_foreign_key "concentracion_x_medicamentos", "concentracions"
  add_foreign_key "concentracion_x_medicamentos", "medicamentos"
  add_foreign_key "diagnostico_x_registro_consulta", "patologia"
  add_foreign_key "diagnostico_x_registro_consulta", "registro_consulta"
  add_foreign_key "efecto_secundarios", "medicamentos"
  add_foreign_key "historia_clinicas", "usuarios"
  add_foreign_key "horarios", "usuarios"
  add_foreign_key "medicamento_x_patologia", "medicamentos"
  add_foreign_key "medicamento_x_patologia", "patologia"
  add_foreign_key "menus", "rols"
  add_foreign_key "prescripcions", "concentracion_x_medicamentos"
  add_foreign_key "prescripcions", "concentracions"
  add_foreign_key "prescripcions", "receta"
  add_foreign_key "receta", "cita"
  add_foreign_key "registro_consulta", "cita"
  add_foreign_key "signos_vitals", "registro_consulta"
  add_foreign_key "usuarios", "especialidads"
  add_foreign_key "usuarios", "rols"
end
