class ApplicationController < ActionController::Base
  require 'shippo'

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :locale, :bio, :street1, :street2, :city, :state, :zip, :country, :phone, :avatar])
  end
end
