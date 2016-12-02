class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @notify = Notification.new
  end

  def create
    @notify = Notification.new(notify_params)

    @notify.save
    redirect_to notifications_path
  end

  def index
    @notifications = Notification.all
  end

  def show
    @notify = Notification.find(params[:id])
  end

  def edit
    @notify = Notification.find(params[:id])
  end

  def update
    @notify = Notification.find(params[:id])

    if @notify.update(notify_params)
      redirect_to notifications_path
    else
      render 'edit'
    end
  end

  def destroy
    @notify = Notification.find(params[:id])
    @notify.destroy

    redirect_to notifications_path
  end

  private

  def notify_params
    params.require(:notification).permit(:name, :description)
  end
end
