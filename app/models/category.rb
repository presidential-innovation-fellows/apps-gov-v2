class Category < ApplicationRecord
  extend FriendlyId

  has_many :subcategories, dependent: :destroy

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def products
    Product.joins(:product_sub_subcategories).
      merge(product_sub_subcategories).distinct
  end

  private

  def product_sub_subcategories
    ProductSubSubcategory.where(sub_subcategory: sub_subcategories)
  end

  def sub_subcategories
    SubSubcategory.where(subcategory: subcategories)
  end
end
