class ClientsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    @client.save
    redirect_to @client
  end

  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = Client.ransack q_param
    @clients = @q.result.page(page).per(per_page)
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:company, :contact_name, :email, :telephone, :address, :city, :state, :country, :zip)
  end
end
