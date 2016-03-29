class Product < ActiveRecord::Base
  validates \
    :long_description,
    :name, :slug,
    :short_description,
    :url,
    presence: true
end
