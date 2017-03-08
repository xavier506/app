class AddContainerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
        t.string :shipper_seal
        t.string :carrier_seal
        t.string :container_number
        t.string :container_type
        t.string :booking_number
        t.string :liner
        t.date :gate_in
        t.date :gate_out
        t.string :tir
        t.string :vessel
        t.string :client
        t.string :license_plate
        t.string :chasis
        t.integer :units
        t.string :unit_type
        t.decimal :volume
        t.string :volume_units
        t.decimal :tare_weight
        t.decimal :gross_weight
        t.string :weight_units
        t.decimal :truck_tare
        t.decimal :payload
        t.string :treatment_date
        t.string :fumigation_doc
        t.string :fumigation_seal
        t.string :inspector
        t.string :description
        t.string :farm
        t.references :order
        t.timestamps
    end
  end
end
