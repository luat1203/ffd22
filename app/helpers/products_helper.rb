module ProductsHelper
  def categories_ordered
    Category.sort_by_name.map{|c| [c.name, c.id]}
  end

  def truncate_info info
    info.truncate(Settings.product_information.truncate, separator: " ")
  end
end
