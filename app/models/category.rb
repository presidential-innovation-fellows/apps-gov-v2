class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :products, through: :product_categories
  has_many :product_categories

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
