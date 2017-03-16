class Consignee < ApplicationRecord

  has_many :orders, :dependent => :restrict_with_error
  has_many :users

  validates :address, presence: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end

  def consignee_string
    "#{company} #{address} #{city} #{state} #{country} #{zip}"
  end
end
