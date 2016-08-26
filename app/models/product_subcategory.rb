class ProductSubcategory < ApplicationRecord
  belongs_to :subcategory
  belongs_to :product

  validates :subcategory, :product, presence: true
end
