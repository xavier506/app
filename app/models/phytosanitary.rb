class Phytosanitary < ApplicationRecord
  belongs_to :order
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_one :notification, :through => :order

  validates :number,
    :exporter,
    :receiver,
    :organization,
    :place_of_origin,
    :point_of_entry,
    :point_of_exit,
    :mode,
    :description,
    :place_of_issue,
    :issue_date,
    :treatment_date,
    :treatment,
    :active_ingredient,
    :concentration,
    :duration_temperature,
    :responsible,
    :inspector,
   presence: true

  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end
end
