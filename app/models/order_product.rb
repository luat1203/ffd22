class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validates :product_id, uniqueness: true
end
