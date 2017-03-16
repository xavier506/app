class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.text :notes
      t.string :status
      t.string :mode
      t.string :booking_number
      t.string :liner
      t.string :vessel
      t.date :vessel_departure
      t.date :cutoff
      t.string :dua
      t.string :fad
      t.string :customer_invoice
      t.string :weight_units
      t.string :volume_units
      t.references :client
      t.references :consignee
      t.references :notification
      t.timestamps
    end
  end
end
