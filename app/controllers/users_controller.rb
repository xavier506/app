class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = User.ransack q_param
    @users = @q.result.page(page).per(per_page)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = "User could not be saved!"
      render 'edit'
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
      params.require(:user).permit(:email, :password, :user_type, :client_id, :consignee_id, :notification_id, :full_name)
    end
end
