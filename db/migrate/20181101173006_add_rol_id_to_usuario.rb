class AddRolIdToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :rol, foreign_key: true
  end
end
