class Product < ApplicationRecord
  # associations
  has_many :product_categories
  has_many :categories, through: :product_categories

  # validations
  validates :name, presence: true

  # required for active storage
  has_one_attached :image

  # required for active admin customization?
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  # pagination
  paginates_per 8
end
