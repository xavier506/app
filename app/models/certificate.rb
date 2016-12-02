class Certificate < ApplicationRecord
  belongs_to :order

  has_one :notification
end
