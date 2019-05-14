class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validates :product_id, presence: true
  after_destroy :destroy_blank_order, :return_quantity_product

  def destroy_blank_order
    order = Order.find_by(id: order_id)
    order.destroy if order.order_products.empty?
  end

  def return_quantity_product
    product = Product.find_by(id: product_id)
    return unless product
    product.update_attributes quantity: product.quantity + quantity.to_i
  end
end
