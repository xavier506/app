class AddEtaToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :eta_date, :date
    add_column :orders, :delivered_to_port, :boolean
    add_column :orders, :bl_print, :boolean
    add_column :orders, :phyto_print, :boolean
    add_column :orders, :co_print, :boolean
    add_column :orders, :invoice_paid, :boolean
  end
end
