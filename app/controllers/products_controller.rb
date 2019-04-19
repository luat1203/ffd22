class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def show; end

  def index
    @products = Product.all.order_desc.paginate page: params[:page],
      per_page: Settings.per_page.products
    @cart_product
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t("controllers.products.product_not_found")
    redirect_to root_path
  end
end
