class CreateEspecialidads < ActiveRecord::Migration[5.1]
  def change
    create_table :especialidads do |t|
      t.text :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
