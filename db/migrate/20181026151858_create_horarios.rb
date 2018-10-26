class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.text :horario
      t.text :dia
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
