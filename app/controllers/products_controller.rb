class ProductsController < ApplicationController
  before_action :load_product, only: %i(show destroy)

  def show; end

  def destroy
    if @product.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_failed"
    end
    redirect_to request.referrer || root_path
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "controllers.products.product_not_found"
    redirect_to root_path
  end
end
