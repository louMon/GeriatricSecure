class AddFieldDisponibleToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :disponible_admin, :boolean
    add_column :menus, :disponible_medico, :boolean
    add_column :menus, :disponible_recepcionista, :boolean
    add_column :menus, :disponible_enfermero, :boolean
  end
end
