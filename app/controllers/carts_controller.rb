class CartsController < ApplicationController
  def create
    @product_id = params[:cart][:product_id]
    session[4] = 13
  end

  def show
    init
    load_cart_products
  end

  private

  def init
    session[3] = 4
  end

  def load_cart_products
    @cart_products = {session[4] => 2}
  end
end
