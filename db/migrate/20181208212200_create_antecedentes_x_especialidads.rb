class CreateAntecedentesXEspecialidads < ActiveRecord::Migration[5.1]
  def change
    create_table :antecedentes_x_especialidads do |t|
      t.references :patologia, foreign_key: true
      t.references :especialidads, foreign_key: true

      t.timestamps
    end
  end
end
