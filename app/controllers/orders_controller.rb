class OrdersController < ApplicationController
  before_action :load_order, only: :show

  def show
    @order_products = @order.order_products
  end

  def create
    @order = current_user.orders.build(total_price: total_price)
    @cart_products.each do |product_id, quantity|
      product = Product.find_by id: product_id
      order_products = @order.order_products.build(product_id: product_id,
        quantity: quantity, price: product.price)
      order_products.save
    end
    if @order.save
      flash[:success] = "Success"
      redirect_to @order
    end
  end

  def destroy
  end

  private

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order
    flash[:danger] = "This order not found"
    redirect_to root_path
  end

  def total_price
    @total_price = 0
    @cart_products.each do |product_id, quantity|
      product = Product.find_by id: product_id
      @total_price += product.price * quantity.to_i
    end
    @total_price
  end
end
