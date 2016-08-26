class ProductKeyword < ApplicationRecord
  validates :keyword, :product, presence: true

  belongs_to :keyword
  belongs_to :product
end
