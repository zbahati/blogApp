class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[Name Bio Photo]) # Add :name if you want to allow "Name"
    devise_parameter_sanitizer.permit(:account_update, keys: %i[Name Bio Photo]) # Add :name if you want to allow "Name"
  end
end
