class AddFlagToPatologium < ActiveRecord::Migration[5.1]
  def change
    add_column :patologia, :algoritmo_flag, :integer
  end
end
