class Order < ApplicationRecord
  belongs_to :client

  has_many :certificates
  # has_many :phytosanitary
  # has_many :bill_of_lading
end
