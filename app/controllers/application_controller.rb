# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def self.default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:zipcode, :address, :bio])
    end

    def after_sign_in_path_for(resource)
      user_root_path
    end

    def after_sign_out_path_for(resource)
      user_root_path
    end
end
