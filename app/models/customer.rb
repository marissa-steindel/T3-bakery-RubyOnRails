class Customer < ApplicationRecord
  # associations
  belongs_to :province
  has_many :products, through: :orders

  # validations
  validates :name, presence: true

end
