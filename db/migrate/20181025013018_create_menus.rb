class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.text :nombre
      t.boolean :permiso_ver
      t.boolean :permiso_agregar
      t.boolean :permiso_editar
      t.boolean :disponible_paciente
      t.text :icon

      t.timestamps
    end
  end
end
