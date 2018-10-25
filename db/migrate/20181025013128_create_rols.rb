class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.text :nombre
      t.text :descripcion
      t.integer :estado
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
