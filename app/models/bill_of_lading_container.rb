class BillOfLadingContainer < ApplicationRecord
  belongs_to :bill_of_lading
  belongs_to :container
end
