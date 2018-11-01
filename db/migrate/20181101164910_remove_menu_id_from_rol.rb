class RemoveMenuIdFromRol < ActiveRecord::Migration[5.1]
  def change
    remove_column :rols, :menu_id, :reference
  end
end
