class ProductRequest < ActiveRecord::Base
  belongs_to :product, counter_cache: true
  belongs_to :user

  has_drafts

  validates :product, :user, presence: true
  validates_uniqueness_of :user_id, scope: :product_id

  def name
    product.name
  end
end
