class RemovePresionToSignosvital < ActiveRecord::Migration[5.1]
  def change
    remove_column :signos_vitals, :nivel_presion_sistolica, :integer
    remove_column :signos_vitals, :nivel_presion_diastolica, :integer
  end
end
