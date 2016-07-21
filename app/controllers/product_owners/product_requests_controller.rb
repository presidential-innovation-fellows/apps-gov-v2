module ProductOwners
  class ProductRequestsController < ProductOwnersController
    def create
      @product_request = ProductRequest.new(product_request_params)

      if @product_request.draft_creation
        flash[:success] =
          I18n.t("product_owners.product_requests.create.success")
      else
        flash[:error] =
          I18n.t("product_owners.product_requests.create.failure")
      end
      redirect_to product_path(@product_request.product)
    end

    def destroy
      @product_request = ProductRequest.find(params[:id])

      if @product_request.destroy
        flash[:success] =
          I18n.t("product_owners.product_requests.destroy.success")
      else
        flash[:error] =
          I18n.t("product_owners.product_requests.destroy.error")
      end

      redirect_to dashboard_path
    end

    private

    def product_request_params
      params.require(:product_request).
        permit(:product_id).merge(user: signed_in_user)
    end
  end
end
