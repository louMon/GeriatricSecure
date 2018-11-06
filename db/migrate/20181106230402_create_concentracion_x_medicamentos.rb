class CreateConcentracionXMedicamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :concentracion_x_medicamentos do |t|
      t.references :medicamento, foreign_key: true
      t.references :concentracion, foreign_key: true

      t.timestamps
    end
  end
end
