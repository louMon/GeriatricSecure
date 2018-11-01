class AddOrdenToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :orden, :integer
  end
end
