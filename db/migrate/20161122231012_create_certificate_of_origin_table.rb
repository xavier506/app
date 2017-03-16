class CreateCertificateOfOriginTable < ActiveRecord::Migration[5.0]
  def change

    create_table :notifications do |t|
      t.string :company
      t.string :email
      t.string :telephone
      t.string :contact_name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.timestamps
    end

    create_table :certificates do |t|
      t.text :shipper
      t.text :receiver
      t.text :farm
      t.string :mode
      t.text :notify
      t.string :country
      t.string :discharge_port
      t.string :departure_port
      t.text :observations
      t.integer :units
      t.string :unit_type
      t.text :description
      t.decimal :volume
      t.string :volume_units
      t.decimal :gross_weight
      t.string :weight_units
      t.text :invoices
      t.references :order
      t.timestamps
    end
  end
end
