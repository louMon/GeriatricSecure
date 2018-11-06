class RemoveHistoriaClinicaFromRegistroConsultum < ActiveRecord::Migration[5.1]
  def change
    remove_reference :registro_consulta, :historia_clinica, foreign_key: true
  end
end
