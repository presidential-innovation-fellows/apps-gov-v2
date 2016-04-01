class Customer < ActiveRecord::Base
  validates :customer, :product, presence: true

  belongs_to :agency
  belongs_to :product
end
