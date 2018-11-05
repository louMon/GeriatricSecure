class AddPresionArterialToSignosVital < ActiveRecord::Migration[5.1]
  def change
    add_column :signos_vitals, :presion_arterial, :text
  end
end
