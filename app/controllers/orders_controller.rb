class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    @order.save
    redirect_to @order
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(
      :order_date,
      :client_id,
      :consignee_id,
      :notification_id,
      :status,
      :liner,
      :mode,
      :notes,
      :booking_number,
      :vessel,
      :vessel_departure,
      :cutoff,
      :dua,
      :fad,
      :customer_invoice,
    )
  end
end
