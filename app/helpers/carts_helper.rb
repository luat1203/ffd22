module CartsHelper
  def find_product id
    Product.find_by id: id
  end
end
