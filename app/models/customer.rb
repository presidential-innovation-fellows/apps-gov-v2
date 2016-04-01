class Customer < ActiveRecord::Base
  validates :agency, :product, presence: true

  belongs_to :agency
  belongs_to :product
end
