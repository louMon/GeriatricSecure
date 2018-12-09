class AddReferencesToMedicamentosXEspecialidad < ActiveRecord::Migration[5.1]
  def change
    add_reference :medicamentos_x_especialidads, :medicamento, foreign_key: true
    add_reference :medicamentos_x_especialidads, :especialidad, foreign_key: true
  end
end
