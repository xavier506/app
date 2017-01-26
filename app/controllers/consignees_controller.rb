class ConsigneesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    @consignee.save
    redirect_to @consignee
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @consignee.update(consignee_params)
      redirect_to @consignee
    else
      render 'edit'
    end
  end

  def destroy
    @consignee.destroy

    redirect_to consignees_path
  end

  private

  def consignee_params
    params.require(:consignee).permit(:company, :contact_name, :email, :telephone, :address, :city, :state, :country, :zip, :user_id)
  end
end
