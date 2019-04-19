class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      user_activated_or_not @user
    else
      flash.now[:danger] = t ".invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find_by email: params[:session][:email].downcase
    return if @user
    flash[:danger] = t "controllers.sessions.user_not_found"
    redirect_to root_path
  end

  def user_activated_or_not user
    if user.activated?
      log_in user
      redirect_back_or @user
      if params[:session][:remember_me] == Settings.remember_me
        remember user
      else
        forget user
      end
    else
      flash[:warning] = t ".account_not_activated"
      redirect_to root_path
    end
  end
end
