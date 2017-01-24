class Client < ApplicationRecord
  has_many :orders, :dependent => :restrict_with_error
  has_many :users

  validates :company, :email, presence: true
  validates :email, uniqueness: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
