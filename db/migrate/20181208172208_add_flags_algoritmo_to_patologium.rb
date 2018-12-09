class AddFlagsAlgoritmoToPatologium < ActiveRecord::Migration[5.1]
  def change
    add_column :patologia, :alg_sintomas_flag, :integer
    add_column :patologia, :alg_antecedentes_flag, :integer
  end
end
