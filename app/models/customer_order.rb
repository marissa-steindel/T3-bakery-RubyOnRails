class CustomerOrder < ApplicationRecord
  belongs_to :Customer
  belongs_to :Order
end
