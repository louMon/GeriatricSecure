class CreateMedicamentosXEspecialidads < ActiveRecord::Migration[5.1]
  def change
    create_table :medicamentos_x_especialidads do |t|
      t.references :medicamentos, foreign_key: true
      t.references :especialidads, foreign_key: true

      t.timestamps
    end
  end
end
