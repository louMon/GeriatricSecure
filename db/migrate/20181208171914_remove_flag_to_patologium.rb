class RemoveFlagToPatologium < ActiveRecord::Migration[5.1]
  def change
    remove_column :patologia, :algoritmo_flag, :integer
  end
end
