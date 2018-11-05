class CreateSignosVitals < ActiveRecord::Migration[5.1]
  def change
    create_table :signos_vitals do |t|
      t.references :registro_consultum, foreign_key: true
      t.decimal :talla
      t.decimal :peso
      t.integer :nivel_presion_sistolica
      t.integer :nivel_presion_diastolica
      t.text :nivel_azucar
      t.decimal :temperatura

      t.timestamps
    end
  end
end
