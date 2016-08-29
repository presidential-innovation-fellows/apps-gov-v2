class SubSubcategory < ApplicationRecord
  extend FriendlyId

  belongs_to :subcategory
  has_many :products, through: :product_sub_subcategories
  has_many :product_sub_subcategories, dependent: :destroy

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
