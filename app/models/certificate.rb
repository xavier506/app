class Certificate < ApplicationRecord
  validates :order, :shipper, :consignee, presence: true
  belongs_to :order

  has_one :notification
end
