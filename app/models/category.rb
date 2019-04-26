class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :children, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name.maximum}

  scope :find_parent_id, ->{where "parent_id is null"}
  scope :sort_by_name, ->{order :name}
end
