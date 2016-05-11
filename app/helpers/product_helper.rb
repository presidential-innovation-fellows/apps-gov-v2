module ProductHelper
  def product_belongs_to_user?(product)
    ProductRequest.exists?(user_id: signed_in_user, product_id: product.id)
  end
end
