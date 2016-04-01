class Keyword < ActiveRecord::Base
  validates :name, presence: true
end
