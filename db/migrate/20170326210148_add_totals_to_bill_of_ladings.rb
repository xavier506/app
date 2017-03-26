class AddTotalsToBillOfLadings < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_of_ladings, :unit_type, :string
    add_column :bill_of_ladings, :total_units, :decimal
    add_column :bill_of_ladings, :total_weight, :decimal
    add_column :bill_of_ladings, :total_volume, :decimal
  end
end
