class BillOfLading < ApplicationRecord
  belongs_to :order, inverse_of: :bill_of_ladings
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_many :notifications, :through => :order

  def containers(order_id)
    Container.where(order_id: order_id)
  end

  validates :document_number,
    :exporter,
    :receiver,
    :place_of_origin,
    :place_of_reciept,
    # :place_of_delivery,
    # :date_of_reciept,
    # :ocean_vessel,
    # :loading_port,
    # :discharge_port,
    # :description,
    # :freight_charges,
    # :revenue_tons,
    # :rate,
    # :prepaid,
    # :collect,
    # :prepaid_at,
    # :collect_at,
    # :place_of_issue,
    # :issue_date,
    # :service_type,
    # :laden_on_board,
    # :liner,
    :notify,
    :order_id,
  presence: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
