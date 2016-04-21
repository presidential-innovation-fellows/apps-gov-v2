class ProductCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  validates :category, :product, presence: true
end
