class Order < ApplicationRecord
  enum status: {pending: 0, approved: 1, cancelled: 2}
  has_many :order_products
end
