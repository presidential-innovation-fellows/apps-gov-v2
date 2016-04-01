class Contract < ActiveRecord::Base
  validates :description, :name, :slug, presence: true
end
