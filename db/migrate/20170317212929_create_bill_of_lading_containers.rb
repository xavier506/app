class CreateBillOfLadingContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_of_lading_containers do |t|
      t.references :bill_of_lading
      t.references :container
      t.timestamps
    end
  end
end
