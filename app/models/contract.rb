class Contract < ApplicationRecord
  validates :description, :name, :slug, presence: true

  has_many :products, through: :product_contracts
  has_many :product_contracts
end
