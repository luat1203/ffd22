module CartsHelper
  def find_product id
    Product.find_by id: id
  end

  def load_cart_products
    return if current_user.nil?
    if session[current_user.id].present?
      @cart_products = session[current_user.id]
    elsif cookies[current_user.id].present?
      @cart_products = JSON.parse(cookies[current_user.id])
      session[current_user.id] = @cart_products
    else
      @cart_products = nil
    end
  end
end
