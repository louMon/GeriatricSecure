class CreatePathologies < ActiveRecord::Migration[5.1]
  def change
    create_table :pathologies do |t|
      t.text :idpathology
      t.text :cie10_code
      t.text :pathology_name
      t.text :description

      t.timestamps
    end
  end
end
