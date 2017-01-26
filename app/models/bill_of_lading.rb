class BillOfLading < ApplicationRecord
  belongs_to :order
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_many :notifications, :through => :order

  #Options for field selection
  SHIPPERS = ['Evergreen']
  UNIT_TYPES = ['Piezas / Pieces','Cajas / Boxes','Trozas / Logs','Bundles']
  VOLUME_UNITS = ['CBM','CBFT']
  WEIGHT_UNITS = ['KGS','TONS']

  validates :document_number,
    :exporter,
    :receiver,
    :place_of_origin,
    :place_of_reciept,
    :place_of_delivery,
    :date_of_reciept,
    :ocean_vessel,
    :loading_port,
    :discharge_port,
    :container_number,
    :units,:unit_type,
    :description,
    :volume,
    :volume_units,
    :gross_weight,
    :weight_units,
    :freight_charges,
    :revenue_tons,
    :rate,
    :prepaid,
    :collect,
    :bl_number,
    :prepaid_at,
    :collect_at,
    :place_of_issue,
    :issue_date,
    :service_type,
    :laden_on_board,
    :shipper_id,
    :notify,
    :order_id,
  presence: true

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
