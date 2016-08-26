class Customer < ApplicationRecord
  validates :agency, :product, presence: true

  belongs_to :agency
  belongs_to :product
end
