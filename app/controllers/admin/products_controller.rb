module Admin
  class ProductsController < AdminController
    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        flash[:success] = I18n.t("admin.products.create.success_message")
        redirect_to root_path
      else
        flash[:error] = I18n.t("admin.products.create.error_message")
        render :new
      end
    end

    private

    def product_params
      params.require(:product).permit(
        :fedramp_inprocess_agency,
        :founded_year,
        :linkedin_id,
        :location,
        :logo,
        :long_description,
        :name,
        :number_of_employees,
        :sales_poc,
        :short_description,
        :status,
        :twitter_handle,
        :url,
      )
    end
  end
end
