class Product < ActiveRecord::Base
  validates \
    :long_description,
    :name, :slug,
    :sales_poc,
    :short_description,
    :url,
    presence: true

  has_many :agencies, through: :customers
  has_many :customers

  has_many :contracts, through: :product_contracts
  has_many :product_contracts

  has_many :keywords, through: :product_keywords
  has_many :product_keywords
end
