class Product < ApplicationRecord
  # associations
  has_many :product_categories
  has_many :categories, through: :product_categories

  # required for active storage
  has_one_attached :image
  accepts_nested_attributes_for :product_categories, allow_destroy: true
end
