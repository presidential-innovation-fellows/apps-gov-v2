class AtoStatus < ActiveRecord::Base
  validates :ato_type, :product, presence: true

  belongs_to :ato_type
  belongs_to :product
end
