class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true,
    length: {
      maximum: Settings.product_name.maximum,
      minimum: Settings.product_name.minimum
    }
  validates :price, numericality: {greater_than: Settings.product_price.minimum}
  validates :information, presence: true,
    length: {
      maximum: Settings.product_information.maximum,
      minimum: Settings.product_information.minimum
    }
  validates :quantity,
    numericality: {greater_than_or_equal_to: Settings.product_quantity.minimum}
  validates :category_id, presence: true
end
