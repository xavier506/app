class CreateCertificateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :certificate_containers do |t|
      t.references :certificate
      t.references :container
      t.timestamps
    end
  end
end
