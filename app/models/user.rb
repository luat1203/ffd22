class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable
  # before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  enum role: {admin: 1, normal_user: 2}
end
