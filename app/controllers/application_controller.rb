class ApplicationController < ActionController::Base
  include CommonActions

  before_action :set_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar profile name))
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name))
    devise_parameter_sanitizer.permit(:index, keys: %i(id name avatar))
  end
end
