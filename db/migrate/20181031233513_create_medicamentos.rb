class CreateMedicamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :medicamentos do |t|
      t.text :codigo_drug_bank
      t.text :nombre
      t.text :forma_farmaceutica
      t.text :nombre_algoritmo
      t.integer :estado_algoritmo

      t.timestamps
    end
  end
end
