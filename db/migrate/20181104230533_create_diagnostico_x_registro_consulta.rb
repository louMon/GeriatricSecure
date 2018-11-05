class CreateDiagnosticoXRegistroConsulta < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostico_x_registro_consulta do |t|
      t.references :registro_consultum, foreign_key: true
      t.references :patologium, foreign_key: true
      t.decimal :peso_patologia
      t.boolean :es_cronica

      t.timestamps
    end
  end
end
