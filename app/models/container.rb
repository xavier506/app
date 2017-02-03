class Container < ApplicationRecord
  belongs_to :bill_of_lading

  #Options for field selection
  CONTAINER_TYPES = ['40’', '40H', '20’', '40HQ', '40GP', '20GP', '40HC', '40DV', '40RH', '40RF']
  UNIT_TYPES = ['Piezas / Pieces','Cajas / Boxes','Trozas / Logs','Bundles']
  VOLUME_UNITS = ['CBM','CBFT']
  WEIGHT_UNITS = ['KGS','TONS']

  validates :container_number,
    :units,
    :unit_type,
    :volume,
    :volume_units,
    :gross_weight,
    :weight_units,
    :bill_of_lading_id,
  presence: true

end
