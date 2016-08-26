class ProductSubSubcategory < ApplicationRecord
  belongs_to :sub_subcategory
  belongs_to :product

  validates :sub_subcategory, :product, presence: true
end
