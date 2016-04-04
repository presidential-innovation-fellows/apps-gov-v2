class ProductContract < ActiveRecord::Base
  belongs_to :contract
  belongs_to :product

  validates :contract, :product, presence: true
end
