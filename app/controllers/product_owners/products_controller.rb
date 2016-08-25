module ProductOwners
  class ProductsController < ProductOwnersController
    def new
      @product = Product.new
    end

    def edit
      @product = Product.find(params[:id])
    end

    def create
      @product = Product.new(product_params)

      if @product.draft_creation
        Delayed::Job.enqueue AdminProductDraftJob.new(@product)
        flash[:success] = I18n.t("product_owners.products.create.success")
        redirect_to dashboard_path
      else
        flash[:error] = I18n.t("product_owners.products.create.error")
        render :new
      end
    end

    def update
      @product.attributes = product_params

      if @product.draft_update
        Delayed::Job.enqueue AdminProductDraftJob.new(@product)
        flash[:success] = I18n.t("product_owners.products.update.success")
        redirect_to dashboard_path
      else
        flash[:error] = I18n.t("product_owners.products.update.error")
        render :edit
      end
    end

    private

    def product_params
      params.require(:product).permit(
        :founded_year,
        :linkedin_id,
        :location,
        :logo,
        :long_description,
        :name,
        :number_of_employees,
        :sales_poc,
        :short_description,
        :twitter_handle,
        :url
      )
    end
  end
end
