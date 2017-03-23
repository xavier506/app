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

  def order_co_available_containers(co)
    order_containers = BillOfLadingContainer.where(bill_of_lading_id: co.id )
    available_containers = Container.where(order_id: co.order_id).left_outer_joins(:certificate_containers).where( certificate_containers: { id: nil } )
    order_co_available_containers = order_containers + available_containers
    return order_co_available_containers
  end

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
