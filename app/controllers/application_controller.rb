class ApplicationController < ActionController::Base
  include SessionsHelper

  # Confirms an admin user.
  def admin_user
    return unless current_user
    redirect_to(root_url) unless current_user.admin?
  end
end
