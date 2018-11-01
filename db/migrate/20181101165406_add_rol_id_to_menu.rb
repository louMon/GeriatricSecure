class AddRolIdToMenu < ActiveRecord::Migration[5.1]
  def change
    add_reference :menus, :rol, foreign_key: true
  end
end
