class AtoType < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
