class CreateRegistroConsulta < ActiveRecord::Migration[5.1]
  def change
    create_table :registro_consulta do |t|
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
