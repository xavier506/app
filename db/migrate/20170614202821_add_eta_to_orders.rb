class AddEtaToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :eta_date, :date
  end
end
