class Client < ApplicationRecord
  belongs_to :user
  has_many :orders, :dependent => :restrict_with_error

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
