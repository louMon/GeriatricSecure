class AddEstadoToHorario < ActiveRecord::Migration[5.1]
  def change
    add_column :horarios, :estado, :integer
  end
end
