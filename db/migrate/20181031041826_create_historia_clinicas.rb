class CreateHistoriaClinicas < ActiveRecord::Migration[5.1]
  def change
    create_table :historia_clinicas do |t|
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
