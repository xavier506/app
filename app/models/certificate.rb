class Certificate < ApplicationRecord
  belongs_to :order
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_one :notification, :through => :order
  has_many :certificate_containers
  has_many :containers, :through => :certificate_containers

  validates :order,
    :shipper,
    :farm,
    :notify,
    :discharge_port,
    :departure_port,
    :units,
    :volume,
    :gross_weight,
    :invoices,
    :description,
    :receiver,
  presence: true
  # validates_inclusion_of :certificate, :in => MODES

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
