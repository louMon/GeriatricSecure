class CreateDiagnosticoXEspecialidads < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostico_x_especialidads do |t|
      t.references :patologium, foreign_key: true
      t.references :especialidad, foreign_key: true

      t.timestamps
    end
  end
end
