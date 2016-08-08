class ProductPresenter
  def initialize(product_id)
    @product_id = product_id
  end

  def new_product_request
    product.product_requests.new
  end

  def product
    @product = Product.find(@product_id)
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

  def remaining_ato_types
    AtoType.where.not(id: product_ato_types.select(:id))
  end

  def remaining_contracts
    Contract.where.not(id: product_contracts.select(:id))
  end
end
