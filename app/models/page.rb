class Page < ApplicationRecord
  validates :name, presence: true
  validates :content, length: {maximum: 999999}
end
