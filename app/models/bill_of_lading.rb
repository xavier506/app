class BillOfLading < ApplicationRecord
  belongs_to :order, inverse_of: :bill_of_ladings
  has_one :client, :through => :order
  has_one :consignee, :through => :order
  has_many :notifications, :through => :order
  has_many :bill_of_lading_containers
  has_many :containers, :through => :bill_of_lading_containers

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

  validates :precarriage,
            :place_of_reciept,
            :ocean_vessel,
            :place_of_delivery,
  length: { maximum: 24 }

  validates :instructions,
  length: { maximum: 70 }

  validates :exporter,
            :notify,
            :also_notify,
  length: { maximum: 210 }

  validates :receiver,
            :forwarding_agent_references,
   length: { maximum: 175 }

  validates :export_references, length: { maximum: 110 }

  def order_bl_available_containers(bill_of_lading)
    order_containers = BillOfLadingContainer.where(bill_of_lading_id: bill_of_lading.id )
    available_containers = Container.where(order_id: bill_of_lading.order_id)
      .left_outer_joins(:bill_of_lading_containers).where( bill_of_lading_containers: { id: nil } )
    order_bl_available_containers = order_containers + available_containers
    return order_bl_available_containers
  end

  def country_name
    c = ISO3166::Country.find_country_by_alpha2(country)
    c
  end

  def total_containers(bill_of_lading_id)
    BillOfLadingContainer.where(bill_of_lading_id: bill_of_lading_id).count
  end

  # def total_units(bill_of_lading_id)
  #   #Container.where(order_id: order_id).sum(:units)
  # end

  # def total_weight(bill_of_lading_id)
  #   #Container.where(order_id: order_id).sum(:gross_weight)
  # end

  # def total_volume(bill_of_lading_id)
  #   #Container.where(order_id: order_id).sum(:volume)
  # end

  # def unit_type(bill_of_lading_id)
  #   if Container.where(order_id: order_id).exists?
  #     Container.where(order_id: order_id).first.unit_type
  #   end
  # end
end
