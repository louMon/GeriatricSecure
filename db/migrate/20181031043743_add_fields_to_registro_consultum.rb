class AddFieldsToRegistroConsultum < ActiveRecord::Migration[5.1]
  def change
    add_column :registro_consulta, :anamnesis, :text
    add_column :registro_consulta, :descripcion_examen_fisico, :text
    add_column :registro_consulta, :resultado_examen, :text
    add_reference :registro_consulta, :citum, foreign_key: true
    add_reference :registro_consulta, :historia_clinica, foreign_key: true
  end
end
