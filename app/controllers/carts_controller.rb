class CartsController < ApplicationController
  require "json"
  before_action :logged_in_user, :load_cart_products,
    only: %i(create show)
  before_action :load_item, only: :create

  def create
    @cart_products.merge!(@item)
    cookies.permanent[current_user.id] = JSON.generate(@cart_products)
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end

  def show; end

  private

  def load_cart_products
    @cart_products = cart_products
  end

  def load_item
    product_id = params[:cart][:product_id]
    quantity = params[:cart][:quantity]
    check_item_present product_id, quantity
    if @cart_products[product_id].present?
      quantity = @cart_products[product_id].to_i + quantity.to_i
    end
    @item = {product_id => quantity}
  end

  def check_item_present product_id, quantity
    if Product.find_by(id: product_id).blank?
      flash[:danger] = t "controllers.carts.product_not_found"
      redirect_to products_path
    end
    return if quantity >= Settings.carts.minimum_quantity.to_s
    flash[:danger] = t "controllers.carts.must_greater_1"
    redirect_to products_path
  end
end
