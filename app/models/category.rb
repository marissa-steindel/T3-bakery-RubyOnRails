class Category < ApplicationRecord
  # associations
  has_many :product_categories
  has_many :products, through: :product_categories

  # validations
  validates :name, presence: true
end
