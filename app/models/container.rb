class Container < ApplicationRecord
  belongs_to :order
  has_many :bill_of_lading_containers
  has_many :certificate_containers
  has_one :bill_of_lading, :through => :bill_of_lading_containers
  has_one :certificate, :through => :certificate_containers

  #Options for field selection
  CONTAINER_TYPES = ['40’', '40H', '20’', '40HQ', '40GP', '20GP', '40HC', '40DV', '40RH', '40RF']

  def net_weight
    if gross_weight && tare_weight
      gross_weight - tare_weight
    end
  end

  def vgm
    if gross_weight && tare_weight
      tare_weight + gross_weight
    end
  end

  def overpayload
    if payload != nil
      overpayload = gross_weight - payload
      #only display if overload is greater than 0 than include value
      if overpayload > 0
        overpayload
      else
        nil
      end
    end
  end

  validates :container_number,
    :units,
    :unit_type,
    :volume,
    :gross_weight,
    :order_id,
  presence: true

end
