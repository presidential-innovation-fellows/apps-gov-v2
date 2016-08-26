class Agency < ApplicationRecord
  validates :code, :name, presence: true

  has_many :products, through: :customers
  has_many :customers
  has_many :users
end
