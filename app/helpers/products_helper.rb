module ProductsHelper
  def categories_ordered
    Category.order(:name).collect{|c| [c.name, c.id]}
  end
end
