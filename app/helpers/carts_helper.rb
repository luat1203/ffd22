module CartsHelper
  def find_product id
    Product.find_by id: id
  end

  def cart_products
    return if current_user.nil?
    if session[current_user.id].present?
      session[current_user.id].select{|x, y| Product.find_by(id: x).present?}
    elsif cookies[current_user.id].present?
      session[current_user.id] = JSON.parse(cookies[current_user.id]).
        select{|x, y| Product.find_by(id: x).present?}
    else
      nil
    end
  end
end
