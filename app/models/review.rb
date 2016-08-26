class Review < ApplicationRecord
  validates :description, :name, :slug, presence: true
  validates :slug, uniqueness: true

  has_many :product_reviews
  has_many :products, through: :product_reviews
end
