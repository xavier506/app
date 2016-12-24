class Phytosanitary < ApplicationRecord
  belongs_to :order
  has_one :notification
  has_one :client, :through => :order

  validates :number, presence: true
  validates :exporter, presence: true
  validates :consignee, presence: true
  validates :organization, presence: true
  validates :place_of_origin, presence: true
  validates :point_of_entry, presence: true
  validates :point_of_exit, presence: true
  validates :mode, presence: true
  validates :description, presence: true
  validates :place_of_issue, presence: true
  validates :issue_date, presence: true
  validates :treatment_date, presence: true
  validates :treatment, presence: true
  validates :active_ingredient, presence: true
  validates :concentration, presence: true
  validates :duration_temperature, presence: true
  validates :responsible, presence: true
  validates :inspector, presence: true
  validates :order, presence: true

  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
