class AddCamposSignosVitalesToRegistroConsultum < ActiveRecord::Migration[5.1]
  def change
    add_column :registro_consulta, :talla, :decimal
    add_column :registro_consulta, :peso, :decimal
    add_column :registro_consulta, :nivel_azucar, :text
    add_column :registro_consulta, :temperatura, :decimal
    add_column :registro_consulta, :presion_arterial, :text
  end
end
