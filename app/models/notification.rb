class Notification < ApplicationRecord
  has_many :certificates
  validates :name, presence: true
end
