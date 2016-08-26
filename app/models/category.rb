class Category < ApplicationRecord
  extend FriendlyId

  has_many :subcategories, dependent: :destroy

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def products
    Product.joins(:product_subcategories).merge(product_subcategories).distinct
  end

  private

  def product_subcategories
    ProductSubcategory.where(subcategory: subcategories)
  end
end
