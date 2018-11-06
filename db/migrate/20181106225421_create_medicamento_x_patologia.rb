class CreateMedicamentoXPatologia < ActiveRecord::Migration[5.1]
  def change
    create_table :medicamento_x_patologia do |t|
      t.decimal :probabilidad_efectividad
      t.references :patologium, foreign_key: true
      t.references :medicamento, foreign_key: true

      t.timestamps
    end
  end
end
