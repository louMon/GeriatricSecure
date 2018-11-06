class RemoveReferencesFromRecetum < ActiveRecord::Migration[5.1]
  def change
    remove_reference :receta, :usuario, foreign_key: true
    remove_reference :receta, :patologium, foreign_key: true
  end
end
