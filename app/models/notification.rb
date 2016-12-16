class Notification < ApplicationRecord
  validates :name, presence: true
  has_many :certificates
end
