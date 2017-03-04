class ContainersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :order
  load_and_authorize_resource :through => :order

  def new
  end

  def index
    if params[:order_id]
      @containers = @containers
    else
      @containers = Container.all
    end
  end

  def show
  end

  def edit
  end

  def create
    @container.save
    redirect_to @order
  end

  def update
    if @container.update(container_params)
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end

  def destroy
    @container.destroy
    redirect_to order_path(@order)
  end
  private

  def container_params
    params.require(:container).permit(
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
      :booking_number,
      :liner,
      :gate_in,
      :gate_out,
      :tir,
      :vessel,
      :client,
      :license_plate,
      :chasis,
      :truck_tare,
      :payload,
      :treatment_date,
      :fumigation_doc,
      :fumigation_seal,
      :inspector,
      :farm,
      :order_id
    )
  end
end
