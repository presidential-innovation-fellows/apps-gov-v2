class Product < ActiveRecord::Base
  extend FriendlyId

  validates \
    :name,
    :short_description,
    :url,
    presence: true

  validates :slug, presence: true, uniqueness: true

  has_many :agencies, through: :customers
  has_many :customers

  has_many :contracts, through: :product_contracts
  has_many :product_contracts

  has_many :keywords, through: :product_keywords
  has_many :product_keywords

  friendly_id :name, use: [:slugged, :finders]
end
