class ProductPresenter
  def most_popular
    Product.most_popular
  end

  def newest
    Product.all.order("created_at DESC").limit(3)
  end
end
