class Order < ApplicationRecord
  belongs_to :client
  belongs_to :consignee
  belongs_to :notification

  has_many :certificates, :dependent => :restrict_with_error
  has_many :phytosanitaries, :dependent => :restrict_with_error
  has_many :bill_of_ladings, :dependent => :restrict_with_error
  has_many :containers, :dependent => :restrict_with_error

  #Options for field selection
  LINERS = ['EVERGREEN','COSCO','HAPAG-LLOYD','MSC','CMA','NYK','MOL''APL','MAERSK','SEALAND']
  MODES = ['Ocean','Land','Air', 'Export', 'Import', 'Other']
  STATUSES = ['Open','Closed','Void']
  UNIT_TYPES = ['Pieces','Boxes','Logs','Bundles']
  VOLUME_UNITS = ['CBM','CBFT','MTQ']
  WEIGHT_UNITS = ['KGS','LBS']

  def total_containers(order_id)
    Container.where(order_id: order_id).count
  end

  def total_units(order_id)
    Container.where(order_id: order_id).sum(:units)
  end

  def total_weight(order_id)
    Container.where(order_id: order_id).sum(:gross_weight)
  end

  def total_volume(order_id)
    Container.where(order_id: order_id).sum(:volume)
  end

  def unit_type(order_id)
    if Container.where(order_id: order_id).exists?
      Container.where(order_id: order_id).first.unit_type
    end
  end

  validates :client, presence: true
  validates :consignee, presence: true
  validates :notification, presence: true

  def order_for_select
    "#{id} - #{client.company} - #{status}"
  end
end
