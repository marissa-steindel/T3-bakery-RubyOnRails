class Order < ApplicationRecord
  # associations
  belongs_to :customer

  has_many :order_products
  has_many :products, through: :order_products

  has_many :customer_orders
  has_many :customers, through: :customer_orders

  # validations
  validates :status, presence: true

end
