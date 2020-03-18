class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  add_flash_types :success, :danger, :info, :warning
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name image])
  end
end
