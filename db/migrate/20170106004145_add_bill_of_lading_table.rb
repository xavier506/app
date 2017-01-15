class AddBillOfLadingTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_of_ladings do |t|
      t.string :document_number
      t.text :exporter
      t.text :export_references
      t.text :consignee
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
      t.string :container_number
      t.integer :units
      t.string :unit_type
      t.text :description
      t.decimal :volume
      t.string :volume_units
      t.decimal :gross_weight
      t.string :weight_units
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
      t.integer :shipper_id
      t.references :notification
      t.text :also_notify
      t.references :order
      t.timestamps
    end
  end
end
