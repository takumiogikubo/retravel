class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name,:account,:self_introduction,:profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:name,:account,:self_introduction,:profile_image])
  end

  def after_sign_in_path_for(resource)
    customers_my_page_path
  end




end
