class NotificationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    @notification.save
    redirect_to notifications_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @notification.update(notify_params)
      redirect_to notifications_path
    else
      render 'edit'
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path
  end

  private

  def notification_params
    params.require(:notification).permit(:name, :description)
  end
end
