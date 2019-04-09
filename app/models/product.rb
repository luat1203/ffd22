class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true,
    length: {
      maximum: Settings.product_name.maximum,
      minimum: Settings.product_name.minimum
    }
  validates :price, presence: true
  validates :information, presence: true,
    length: {
      maximum: Settings.product_information.maximum,
      minimum: Settings.product_information.minimum
    }
  validates :quantity, presence: true
  validates :category_id, presence: true
  scope :order_desc, ->{order(created_at: :desc)}
end
