class Client < ApplicationRecord
  validates :company, :email, presence: true
  validates :email, uniqueness: true
  has_many :orders
end
