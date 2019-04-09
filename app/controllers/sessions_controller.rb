class SessionsController < ApplicationController
  before_action :load_user, only: :create
  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
        redirect_to @user
      else
        message  = t(".account_not_activated")
        message += t(".check_email")
        flash[:warning] = message
        redirect_to root_path
      end
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
    @user = User.find_by(email: params[:session][:email].downcase)
  end
end
