class Order < ApplicationRecord
  belongs_to :client
  belongs_to :consignee
  belongs_to :notification

  # has_one :user, :through => :client
  # has_one :user, :through => :consignee
  # has_one :user, :through => :notification

  has_many :certificates, :dependent => :restrict_with_error
  has_many :phytosanitaries, :dependent => :restrict_with_error
  has_many :bill_of_ladings, :dependent => :restrict_with_error

  #Options for field selection
  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']
  STATUSES = ['Open','Closed','Void']

  validates :client, presence: true
  validates :consignee, presence: true
  validates :notification, presence: true

  def order_for_select
    "#{id} - #{client.company} - #{status}"
  end
end
