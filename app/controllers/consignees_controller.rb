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
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = Consignee.ransack q_param
    @consignees = @q.result.page(page).per(per_page)
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
    params.require(:consignee).permit(:company,
      :contact_name,
      :email,
      :telephone,
      :address,
      :city,
      :state,
      :country,
      :zip,
      :user_id
    )
  end
end
