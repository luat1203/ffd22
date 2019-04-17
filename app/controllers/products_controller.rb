class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:info] = t "controllers.products.product_created"
      redirect_to @product
    else
      render :new
    end
  end

  def show; end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t("controllers.products.product_not_found")
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit :name, :image, :price, :information,
      :classify, :quantity, :category_id
  end
end
