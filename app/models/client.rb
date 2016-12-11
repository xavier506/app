class Client < ApplicationRecord
  validates :company, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  has_many :orders
end
