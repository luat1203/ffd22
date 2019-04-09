class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  before_action :set_locale
  before_action :load_cart_products
  helper_method :current_order

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "controllers.application.logged_in_user.please_log_in"
    redirect_to login_path
  end
end
