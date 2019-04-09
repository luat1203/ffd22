module ProductsHelper
  def truncate_info info
    info.truncate(117, separator: " ")
  end
end
