class Category < ActiveRecord::Base
  has_many :products, through: :product_categories
  has_many :product_categories

  validates :name, presence: true
end
