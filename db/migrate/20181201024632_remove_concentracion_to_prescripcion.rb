class RemoveConcentracionToPrescripcion < ActiveRecord::Migration[5.1]
  def change
    remove_reference :prescripcions, :concentracion, foreign_key: true
  end
end
