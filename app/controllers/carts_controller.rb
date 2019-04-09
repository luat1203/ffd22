class CartsController < ApplicationController
  require "json"
  before_action :init_cookies_session, only: :create
  before_action :logged_in_user, :load_cart_products,
    only: %i(create show destroy update)

  def create
    product_id = params[:cart][:product_id]
    quantity = params[:cart][:quantity]
    if @cart_products.blank?
      @cart_products = {}
    else
      quantity = @cart_products[product_id].to_i + quantity.to_i
    end
    item = {product_id => quantity}
    @cart_products.merge!(item)
    cookies.permanent[current_user.id] = JSON.generate(@cart_products)
    session[current_user.id][product_id] = quantity
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def show
  end

  def update
    session[current_user.id][params[:cart][:product_id]] = params[:cart][:quantity]
    @cart_products = session[current_user.id]
    cookies.permanent[current_user.id] = JSON.generate(@cart_products)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def destroy
    session[current_user.id].delete("#{params[:product_id]}")
    @cart_products = session[current_user.id]
    cookies.permanent[current_user.id] = JSON.generate(@cart_products)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  private

  def init_cookies_session
    session[current_user.id] = Hash.new() if session[current_user.id].blank?
  end

  def load_cart_products
    @cart_products = cart_products
  end
end
