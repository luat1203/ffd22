class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def show
    @products = @category.products.order_desc.paginate page: params[:page],
      per_page: Settings.per_page.products
  end

  def load_category
    @category = Category.find_by params[:id]
  end
end
