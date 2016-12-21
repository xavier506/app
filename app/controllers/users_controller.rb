class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = "Client could not be saved!"
      render 'show'
    end
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = "Welcome !"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
     @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end
end
