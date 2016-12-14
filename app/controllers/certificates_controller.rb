class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @co = Certificate.new
  end

  def index
     @cos= Certificate.all
  end

  def show
    @co = Certificate.find(params[:id])
  end

  def edit
    @co = Certificate.find(params[:id])
  end

  def create
    @co = Certificate.new(certificate_params)

    @co.save
    redirect_to @co.order
  end

  def update
    @co = Certificate.find(params[:id])

    if @co.update(certificate_params)
      redirect_to @co
    else
      render 'edit'
    end
  end

  def destroy
    @co = Certificate.find(params[:id])
    @co.destroy

    redirect_to certificates_path
  end
  private

  def certificate_params
    params.require(:certificate).permit(:shipper, :consignee, :farm, :country, :mode, :order_id, :notification_id, :discharge_port, :departure_port, :observations, :units, :unit_type, :volume, :volume_units, :gross_weight, :weight_units, :invoices, :description)
  end
end
