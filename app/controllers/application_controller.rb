class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale
  helper_method :current_order

  def cart_products
    session
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

end
