class ProductPresenter
  def initialize(product_id)
    @product_id = product_id
  end

  def new_product_request
    product.product_requests.new
  end

  def product
    @product = Product.friendly.find(@product_id)
  end

  def product_ato_types
    @product_ato_types ||= product.ato_types
  end

  def product_ato_statuses
    @product_ato_statuses ||= product.ato_statuses
  end

  def product_contracts
    @product_contracts ||= product.contracts
  end

  def product_product_reviews
    @product_reviews ||= product.product_reviews
  end

  def product_reviews
    @product_reviews ||= product.reviews
  end

  def remaining_ato_types
    AtoType.where.not(id: product_ato_types.select(:id))
  end

  def remaining_reviews
    Review.where.not(id: product_reviews.select(:id))
  end
end
