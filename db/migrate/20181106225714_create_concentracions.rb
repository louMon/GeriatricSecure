class CreateConcentracions < ActiveRecord::Migration[5.1]
  def change
    create_table :concentracions do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
