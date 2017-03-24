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
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = Order.ransack q_param
    @orders = @q.result.page(page).per(per_page)
  end

  def show
    q_param = params[:q]
    page = params[:page]
    per_page = 10

    @order_containers = Container.where(order_id: @order.id).ransack q_param
    @order_containers = @order_containers.result.page(page).per(per_page)
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
      :volume_units,
      :weight_units,
    )
  end
end
