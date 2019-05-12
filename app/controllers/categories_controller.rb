class CategoriesController < ApplicationController
  before_action :load_category, except: %i(new create index)
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.includes(:children).find_parent_id.order(:name)
                          .paginate(
                            page: params[:page], per_page: Settings.per_page
                          )
  end

  def show
    @products = Product.where(category_id: params[:id])
                       .paginate(page: params[:page],
                         per_page: Settings.per_page)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".create_category"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".category_updated"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_failed"
    end
    redirect_to :categories
  end

  private

  def category_params
    params.require(:category).permit :name, :parent_id
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".category_not_found"
    redirect_to categories_path
  end
end
