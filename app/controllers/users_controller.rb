class UsersController < ApplicationController
  before_action :load_user, only: :show
  before_action :authenticate_user!, only: %i(index show)

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def show; end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".load_user.user_not_found"
    redirect_to :root
  end
end
