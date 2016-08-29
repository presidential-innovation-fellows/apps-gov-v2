class Subcategory < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  has_many :sub_subcategories, dependent: :destroy

  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def active_sub_subcategories
    sub_subcategories.joins(:products).distinct
  end

  def shortname
    if name.length > 25
      name.truncate(28)
    else
      name
    end
  end
end
