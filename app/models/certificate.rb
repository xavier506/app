class Certificate < ApplicationRecord
  validates :order, :presence => true
  validates :shipper, :presence => true
  validates :consignee, :presence => true
  belongs_to :order

  has_one :notification
end
