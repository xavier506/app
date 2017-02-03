class BillOfLadingsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :order
  load_and_authorize_resource :through => :order, shallow: true

  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @bill_of_lading.save
    redirect_to @bill_of_lading.order
  end

  def update
    if @bill_of_lading.update(bill_of_lading_params)
      redirect_to order_bill_of_lading_path(@bill_of_lading)
    else
      render 'edit'
    end
  end

  def destroy
    @bill_of_lading.destroy
    redirect_to order_bill_of_ladings_path
  end
  private

  def bill_of_lading_params
    params.require(:bill_of_lading).permit(
      :document_number,
      :exporter,
      :export_references,
      :receiver,
      :forwarding_agent_references,
      :place_of_origin,
      :place_of_reciept,
      :place_of_delivery,
      :date_of_reciept,
      :precarriage,
      :ocean_vessel,
      :loading_port,
      :discharge_port,
      :instructions,
      :container_number,
      :units,
      :unit_type,
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
      :original_number,
      :prepaid_at,
      :collect_at,
      :place_of_issue,
      :issue_date,
      :exchange_rate_1,
      :exchange_rate_2,
      :service_type,
      :rider_pages,
      :laden_on_board,
      :liner,
      :notify,
      :also_notify,
      :order_id,
      containers_attributes: [
        :shipper_seal,
        :carrier_seal,
        :container_number,
        :container_type,
        :units,
        :unit_type,
        :volume,
        :volume_units,
        :tare_weight,
        :gross_weight,
        :weight_units,
        :bill_of_lading,
        :_destroy
      ]
    )
  end
end
