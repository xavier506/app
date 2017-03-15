class Client < ApplicationRecord
  has_many :users, :dependent => :restrict_with_error
  has_many :orders, :dependent => :restrict_with_error

  has_one :consignee
  has_one :notification

  validates :company, :email, presence: true
  validates :email, uniqueness: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end

  def shipper_string
    "#{company} #{address} #{city} #{state} #{country} #{zip}"
  end
end
