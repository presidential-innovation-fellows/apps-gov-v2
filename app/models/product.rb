class Product < ActiveRecord::Base
  validates \
    :long_description,
    :name, :slug,
    :sales_poc,
    :short_description,
    :url,
    presence: true
end
