class Review < ActiveRecord::Base
  validates :description, :name, :slug, presence: true
  validates :slug, uniqueness: true
end
