class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable
  validates :name, length: {maximum: Settings.name.maximum}
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :orders, dependent: :destroy
  enum role: {admin: 1, normal_user: 2}
end
