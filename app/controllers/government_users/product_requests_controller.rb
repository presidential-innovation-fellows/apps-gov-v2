module GovernmentUsers
  class ProductRequestsController < GovernmentUsersController
    def new
      @product = product
    end

    def create
      @product_request = ProductRequest.new(product_request_params)

      if @product_request.draft_creation
        flash[:success] =
          I18n.t("government_users.product_requests.create.success")
      else
        flash[:error] =
          I18n.t("government_users.product_requests.create.failure")
      end
      redirect_to product_path(product)
    end

    private

    def product
      Product.friendly.find(params[:product_id])
    end

    def product_request_params
      params.
        require(:product_request).
        permit(
          :authorizing_official_email,
          :contract_officer_email
        ).merge(product: product, user: signed_in_user)
    end
  end
end
