class ProductContract < ApplicationRecord
  belongs_to :contract
  belongs_to :product

  validates :contract, :product, presence: true
end
