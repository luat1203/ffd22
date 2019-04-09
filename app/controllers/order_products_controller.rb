class OrderProductsController < ApplicationController
  before_action :load_order, only: :create

  def create
    @order_product = @order.order_products.new order_products_params
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  private

  def load_order
    @order = current_order
  end

  def order_products_params
    params.require(:order_product).permit :quantity, :product_id
  end
end
