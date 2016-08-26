class ProductReview < ApplicationRecord
  belongs_to :product
  belongs_to :review

  validates :product, :review, presence: true
end
