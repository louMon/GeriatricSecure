class CreatePatologia < ActiveRecord::Migration[5.1]
  def change
    create_table :patologia do |t|
      t.text :codigo_cie
      t.text :nombre
      t.text :descripcion
      t.text :nombre_algoritmo

      t.timestamps
    end
  end
end
