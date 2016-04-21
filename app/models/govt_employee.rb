class GovtEmployee < ActiveRecord::Base
  belongs_to :agency
  belongs_to :user

  validates :agency, :user, presence: true
end
