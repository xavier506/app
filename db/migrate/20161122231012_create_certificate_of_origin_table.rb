class CreateCertificateOfOriginTable < ActiveRecord::Migration[5.0]
  def change

    create_table :notifications do |t|
      t.text :name
      t.text :description
      t.timestamps
    end

    create_table :certificates do |t|
      t.text :shipper
      t.text :consignee
      t.text :farm
      t.string :mode
      t.references :order
      t.references :notification
      t.string :country
      t.string :discharge_port
      t.string :departure_port
      t.text :observations
      t.integer :units
      t.text :description
      t.decimal :volume
      t.decimal :gross_weight
      t.text :invoices
      t.timestamps
    end
  end
end
