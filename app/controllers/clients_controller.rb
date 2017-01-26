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
    params.require(:client).permit(:company, :contact_name, :email, :telephone, :address, :city, :state, :country, :zip, :user_id)
  end
end
