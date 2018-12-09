class CreateEnfermedadCronicas < ActiveRecord::Migration[5.1]
  def change
    create_table :enfermedad_cronicas do |t|
      t.references :historia_clinica, foreign_key: true
      t.references :patologium, foreign_key: true

      t.timestamps
    end
  end
end
