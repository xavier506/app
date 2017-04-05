class AddPcainvoiceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_ref, :string
    add_column :orders, :pca_invoice_number, :string
    add_column :orders, :pca_invoice_url, :string
    add_column :orders, :place_of_delivery, :string
  end
end
