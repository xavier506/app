class AddFumigationToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :fumigation_date, :date
    add_column :orders, :fumigation_url, :string
  end
end
