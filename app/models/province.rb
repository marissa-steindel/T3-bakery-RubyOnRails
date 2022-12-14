class Province < ApplicationRecord
  # associations
  has_many :customers

  # validations
  validates :name, presence: true
end
