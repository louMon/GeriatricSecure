class AddReferenciaToPatologium < ActiveRecord::Migration[5.1]
  def change
    add_reference :patologia, :especialidad, foreign_key: true
  end
end
