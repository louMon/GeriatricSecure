class CreateCita < ActiveRecord::Migration[5.1]
  def change
    create_table :cita do |t|
      t.datetime :fecha_registro
      t.references :horario, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
