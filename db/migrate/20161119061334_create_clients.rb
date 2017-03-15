class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :company
      t.string :email
      t.string :telephone
      t.string :contact_name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.timestamps
    end
  end
end
