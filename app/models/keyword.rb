class Keyword < ApplicationRecord
  validates :name, presence: true

  has_many :products, through: :product_keywords
  has_many :product_keywords
end
