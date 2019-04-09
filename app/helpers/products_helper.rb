module ProductsHelper
  def categories_ordered
    Category.order(:name).collect{|c| [c.name, c.id]}
  end

  def truncate_info info
    info.truncate(Settings.product_information.truncate, separator: " ")
  end
end
