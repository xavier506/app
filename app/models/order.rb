class Order < ApplicationRecord
  belongs_to :client
  validates :client, presence: true

  has_many :certificates
  # has_many :phytosanitary
  # has_many :bill_of_lading

  def order_for_select
    "#{id} - #{client.company} - #{status}"
  end
end
