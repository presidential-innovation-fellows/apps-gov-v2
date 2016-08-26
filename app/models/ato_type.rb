class AtoType < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :products, through: :ato_statuses
  has_many :ato_statuses, dependent: :destroy
end
