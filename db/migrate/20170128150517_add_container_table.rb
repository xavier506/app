class AddContainerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
        t.string :shipper_seal
        t.string :carrier_seal
        t.string :container_number
        t.string :container_type
        t.integer :units
        t.string :unit_type
        t.decimal :volume
        t.string :volume_units
        t.decimal :tare_weight
        t.decimal :gross_weight
        t.string :weight_units
        t.references :order
        t.timestamps
    end
  end
end
