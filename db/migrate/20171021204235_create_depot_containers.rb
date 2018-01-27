class CreateDepotContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :depot_containers do |t|
      t.string :status
      t.string :container_type
      t.string :booking_number
      t.string :liner
      t.string :container_number
      t.date :gate_in
      t.date :gate_out
      t.string :vessel
      t.string :tir
      t.string :client
      t.string :shipper
      t.string :consignee
      t.string :license_plate
      t.decimal :tare_weight
      t.decimal :gross_weight
      t.decimal :net_weight
      t.decimal :vgm_weight
      t.decimal :payload
      t.text :notes

      t.timestamps
    end
  end
end
