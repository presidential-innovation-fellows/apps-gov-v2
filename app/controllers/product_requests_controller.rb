class ProductRequestsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do
    redirect_to new_product_owner_registration_path
  end

  def create
    @product_request = ProductRequest.new(product_request_params)

    if @product_request.save
      flash[:success] = I18n.t("product_requests.create.success")
    else
      flash[:error] = I18n.t("product_requests.create.failure")
    end
    redirect_to product_path(@product_request.product)
  end

  private

  def product_request_params
    params.require(:product_request).
      permit(:product_id).merge(user: signed_in_user)
  end
end
