class RemoveReferencesToMedicamentosXEspecialidad < ActiveRecord::Migration[5.1]
  def change
    remove_reference :medicamentos_x_especialidads, :medicamentos, foreign_key: true
    remove_reference :medicamentos_x_especialidads, :especialidads, foreign_key: true
  end
end
