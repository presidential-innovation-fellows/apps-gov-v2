class Subcategory < ApplicationRecord
  extend FriendlyId

  belongs_to :category

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
