class AddEspecialidadToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :especialidad, foreign_key: true
  end
end
