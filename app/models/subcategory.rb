class Subcategory < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category
  has_many :products, through: :product_subcategories
  has_many :product_subcategories

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
