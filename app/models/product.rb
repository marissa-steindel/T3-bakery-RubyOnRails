class Product < ApplicationRecord
  # required for active storage
  has_one_attached :image
end
