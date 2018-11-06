class CreatePrescripcions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescripcions do |t|
      t.references :concentracion, foreign_key: true
      t.text :via_administracion
      t.integer :cantidad_farmacos
      t.references :recetum, foreign_key: true
      t.text :dosis
      t.references :concentracion_x_medicamento, foreign_key: true

      t.timestamps
    end
  end
end
