class AddEstadoToCitum < ActiveRecord::Migration[5.1]
  def change
    add_column :cita, :estado, :integer
  end
end
