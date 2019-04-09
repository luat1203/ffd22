class Order < ApplicationRecord
  enum status: {pending: 0, approved: 1, cancelled: 2}
end
