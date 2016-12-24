class Certificate < ApplicationRecord
  belongs_to :order
  has_one :notification
  has_one :client, :through => :order

  #Options for field selection
  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']
  UNIT_TYPES = ['Piezas / Pieces','Cajas / Boxes','Trozas / Logs','Bundles']
  VOLUME_UNITS = ['CBM','CBFT']
  WEIGHT_UNITS = ['KGS','TONS']

  validates :order, :shipper, :farm, :notification_id, :discharge_port, :departure_port, :units, :volume, :gross_weight, :invoices, :description, :consignee, presence: true
  # validates_inclusion_of :certificate, :in => MODES

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
