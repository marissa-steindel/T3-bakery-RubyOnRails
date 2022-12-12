class Customer < ApplicationRecord
  belongs_to :province
  has_many :products, through: :orders
end
