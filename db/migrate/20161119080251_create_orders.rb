class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.text :notes
      t.string :status
      t.string :mode
      t.references :client
      t.references :consignee
      t.references :notification
      t.timestamps
    end
  end
end
