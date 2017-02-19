class BillOfLading < ApplicationRecord
  belongs_to :order
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_many :notifications, :through => :order
  has_many :containers, inverse_of: :bill_of_lading

  accepts_nested_attributes_for :containers, reject_if: :all_blank, allow_destroy: true

  #Options for field selection
  LINERS = ['EVERGREEN','MSC','HAPAG-LLOYD','COSCO','CMA','NYK','MOL']
  CONTAINER_TYPES = ['40’', '40H', '20’', '40HQ', '40GP', '20GP', '40HC', '40DV', '40RH', '40RF']
  UNIT_TYPES = ['Piezas / Pieces','Cajas / Boxes','Trozas / Logs','Bundles']
  VOLUME_UNITS = ['CBM','CBFT']
  WEIGHT_UNITS = ['KGS','TONS']

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
    # :bl_number,
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
