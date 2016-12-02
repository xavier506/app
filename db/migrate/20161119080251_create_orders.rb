class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.text :notes
      t.string :status
      t.string :mode
      t.string :co_ids
      t.string :bl_ids
      t.string :ps_ids
      t.references :client
      t.timestamps
    end
  end
end
