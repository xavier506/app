class AddTermsToBillOfLadings < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_of_ladings, :payment_terms, :string
  end
end
