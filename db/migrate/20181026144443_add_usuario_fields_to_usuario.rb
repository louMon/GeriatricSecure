class AddUsuarioFieldsToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :nombres, :text
    add_column :usuarios, :apellidos, :text
    add_column :usuarios, :dni, :text
    add_column :usuarios, :fecha_nacimiento, :datetime
    add_column :usuarios, :genero, :text
    add_column :usuarios, :estado, :integer
    add_column :usuarios, :telefono, :text
    add_column :usuarios, :colegiatura, :text
    add_column :usuarios, :categoria, :integer
    add_column :usuarios, :direccion, :text
    add_reference :usuarios, :rol, foreign_key: true
    add_reference :usuarios, :especialidad, foreign_key: true
  end
end
