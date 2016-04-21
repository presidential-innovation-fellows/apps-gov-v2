class Agency < ActiveRecord::Base
  validates :code, :name, presence: true

  has_many :contract_officers
  has_many :govt_employees
  has_many :products, through: :customers
  has_many :customers
end
