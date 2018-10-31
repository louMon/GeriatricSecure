class RemoveUsuarioFromRegistroConsultum < ActiveRecord::Migration[5.1]
  def change
    remove_reference :registro_consulta, :usuario, foreign_key: true
  end
end
