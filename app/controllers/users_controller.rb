class UsersController < ApplicationController
  before_action :load_user, only: :show

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t(".check_email")
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end
end
