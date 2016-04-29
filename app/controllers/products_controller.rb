class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product_request = @product.product_requests.new
  end

  def search
    if params[:products]
      @products = Product.search(params[:products][:name]).order(:name)
    else
      flash[:error] = I18n.t("products.search.failure")
      redirect_to last_page_or_root
    end
  end

  private

  def last_page_or_root
    if request.referer
      URI.parse(request.referer).path
    else
      root_path
    end
  end
end
