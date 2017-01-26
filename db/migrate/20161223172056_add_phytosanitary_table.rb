class AddPhytosanitaryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :phytosanitaries do |t|
      t.integer :number
      t.text :exporter
      t.text :receiver
      t.text :notify
      t.string :organization
      t.string :place_of_origin
      t.string :point_of_entry
      t.string :point_of_exit
      t.string :mode
      t.text :description
      t.text :additional_declaration
      t.string :place_of_issue
      t.date :issue_date
      t.date :treatment_date
      t.string :treatment
      t.string :active_ingredient
      t.string :concentration
      t.string :duration_temperature
      t.string :responsible
      t.string :inspector
      t.references :order
      t.timestamps
    end
  end
end
