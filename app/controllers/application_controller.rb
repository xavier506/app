class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :email, :password, :current_password, :admin, :client_id])
  end
end
