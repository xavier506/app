class ClientsController < ApplicationController
  before_action :authenticate_user!

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    @client.save
    redirect_to @client
  end

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:company, :contact_name, :email, :telephone, :address, :city, :country, :zip, :user_id)
  end
end
