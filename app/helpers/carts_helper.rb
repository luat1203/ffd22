module CartsHelper
  def find_product id
    product = Product.find_by id: id
    return product if product
    flash[:danger] = t "controllers.carts.product_not_found"
    redirect_to products_path
  end

  def cart_products
    return {} if current_user.nil? || cookies[current_user.id].blank?
    JSON.parse(cookies[current_user.id])
        .select{|x| Product.find_by(id: x).present?}
  end

  def render_cart_quantity
    cart_products.blank? ? Settings.carts.no_product : cart_products.size
  end
end
