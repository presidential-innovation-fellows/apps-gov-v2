class Agency < ActiveRecord::Base
  validates :code, :name, presence: true
end
