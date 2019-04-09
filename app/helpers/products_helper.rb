module ProductsHelper
  def truncate_product_info info
    info.truncate(117, separator: " ")
  end
end
