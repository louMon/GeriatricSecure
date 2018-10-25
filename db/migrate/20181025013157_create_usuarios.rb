class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.text :nombres
      t.text :apellidos
      t.text :dni
      t.datetime :fecha_nacimiento
      t.text :genero
      t.text :correo_electronico
      t.integer :estado
      t.text :telefono
      t.text :nombre_usuario
      t.text :contrasenha
      t.references :rol, foreign_key: true

      t.timestamps
    end
  end
end
