class AddReferencesToAntecedentesXEspecialidad < ActiveRecord::Migration[5.1]
  def change
    add_reference :antecedentes_x_especialidads, :patologium, foreign_key: true
    add_reference :antecedentes_x_especialidads, :especialidad, foreign_key: true
  end
end
