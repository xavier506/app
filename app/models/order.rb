class Order < ApplicationRecord
  belongs_to :client
  belongs_to :consignee
  belongs_to :notification

  has_many :certificates, :dependent => :restrict_with_error
  has_many :phytosanitaries, :dependent => :restrict_with_error
  has_many :bill_of_ladings, :dependent => :restrict_with_error
  has_many :containers, :dependent => :restrict_with_error

  #Options for field selection
  LINERS = ['EVERGREEN','MSC','HAPAG-LLOYD','COSCO','CMA','NYK','MOL']
  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']
  STATUSES = ['Open','Closed','Void']

  def total_units(order_id)
    Container.where(order_id: order_id).sum(:units)
  end

  def total_weight(order_id)
    Container.where(order_id: order_id).sum(:gross_weight)
  end

  validates :client, presence: true
  validates :consignee, presence: true
  validates :notification, presence: true

  def order_for_select
    "#{id} - #{client.company} - #{status}"
  end
end
