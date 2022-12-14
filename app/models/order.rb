class Order < ApplicationRecord
  # associations
  belongs_to :customer

  # validations
  validates :status, presence: true

end
