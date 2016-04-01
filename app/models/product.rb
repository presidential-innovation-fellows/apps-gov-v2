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
end
