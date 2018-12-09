class RemoveReferencesToAntecedentesXEspecialidad < ActiveRecord::Migration[5.1]
  def change
    remove_reference :antecedentes_x_especialidads, :patologia, foreign_key: true
    remove_reference :antecedentes_x_especialidads, :especialidads, foreign_key: true
  end
end
