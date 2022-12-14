class ProductCategory < ApplicationRecord
  belongs_to :product   # product_id FK in Products table in the ProductCategories table
  belongs_to :category  # category_id FK in the ProductCategories table
end
