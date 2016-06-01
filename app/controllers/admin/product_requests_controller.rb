module Admin
  class ProductRequestsController < AdminController
    def edit
      @product_request = ProductRequest.find(params[:id])
      @product_request_draft = @product_request.draft
    end

    def update
      @product_request = ProductRequest.find(params[:id])

      if @product_request.draft.publish!
        flash[:success] = I18n.t("admin.product_requests.update.success")
        redirect_to admin_dashboard_path
      else
        flash[:success] = I18n.t("admin.product_requests.update.error")
        render :edit
      end
    end
  end
end
