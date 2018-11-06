class CreateEfectoSecundarios < ActiveRecord::Migration[5.1]
  def change
    create_table :efecto_secundarios do |t|
      t.references :medicamento, foreign_key: true
      t.decimal :probabilidad_efecto
      t.text :descripcion

      t.timestamps
    end
  end
end
