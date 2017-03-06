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
      t.string :freight_charges
      t.string :revenue_tons
      t.string :rate
      t.string :prepaid
      t.string :collect
      t.string :original_number
      t.string :prepaid_at
      t.string :collect_at
      t.string :place_of_issue
      t.date :issue_date
      t.decimal :exchange_rate_1
      t.decimal :exchange_rate_2
      t.string :service_type
      t.string :laden_on_board
      t.integer :rider_pages
      t.decimal :total_cmb
      t.decimal :verfified_gross_mass
      t.references :order
      t.timestamps
    end
  end
end
