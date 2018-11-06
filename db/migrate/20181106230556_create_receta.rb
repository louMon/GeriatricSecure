class CreateReceta < ActiveRecord::Migration[5.1]
  def change
    create_table :receta do |t|
      t.references :patologium, foreign_key: true
      t.references :citum, foreign_key: true
      t.references :usuario, foreign_key: true
      t.text :observaciones

      t.timestamps
    end
  end
end
