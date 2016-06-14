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
        flash[:error] = I18n.t("admin.product_requests.update.error")
        render :edit
      end
    end

    def destroy
      @product_request = ProductRequest.find(params[:id])

      if @product_request.destroy!
        flash[:success] = I18n.t("admin.product_requests.destroy.success")
        redirect_to admin_dashboard_path
      else
        flash[:error] = I18n.t("admin.product_requests.destroy.error")
        render :edit
      end
    end

    private

    def product_request
      @product_request ||= ProductRequest.find(params[:product_request_id])
    end
  end
end
