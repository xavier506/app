class Client < ApplicationRecord
  has_many :orders

  validates :company, :email, presence: true
  validates :email, uniqueness: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
