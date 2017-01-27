class AddBillOfLadingTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_of_ladings do |t|
      t.string :document_number
      t.string :liner
      t.text :receiver
      t.text :notify
      t.text :also_notify
      t.text :exporter
      t.text :export_references
      t.text :forwarding_agent_references
      t.string :place_of_origin
      t.string :place_of_reciept
      t.string :place_of_delivery
      t.date :date_of_reciept
      t.string :precarriage
      t.string :ocean_vessel
      t.string :loading_port
      t.string :discharge_port
      t.text :instructions
      t.text :description
      t.text :freight_charges
      t.text :revenue_tons
      t.text :rate
      t.text :prepaid
      t.text :collect
      t.string :bl_number
      t.string :original_number
      t.string :prepaid_at
      t.string :collect_at
      t.string :place_of_issue
      t.date :issue_date
      t.decimal :exchange_rate_1
      t.decimal :exchange_rate_2
      t.text :service_type
      t.text :laden_on_board
      t.integer :rider_pages
      t.decimal :total_cmb
      t.decimal :verfified_gross_mass
      t.references :order

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

      t.timestamps
    end
  end
end
