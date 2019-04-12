class UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".check_email"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".load_user.user_not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :phone, :password,
      :password_confirmation
  end
end
