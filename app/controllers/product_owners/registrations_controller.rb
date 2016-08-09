class ProductOwners::RegistrationsController < RegistrationsController
  respond_to :html, :json
  layout "minimal"

  def create
    super

    if resource.save && product_id.present?
      ProductRequest.new(
        product_id: product_id,
        user_id: resource.id
      ).draft_creation
    end
  end

  private

  def account_update_params
    params.require(:product_owner).
      permit(
        :current_password,
        :email,
        :first_name,
        :last_name,
        :password
      )
  end

  def after_sign_up_path_for(_user)
    dashboard_path
  end

  def product_id
    params[:product_owner][:product_id]
  end

  def sign_up_params
    params.require(:product_owner).
      permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :product_id
      )
  end
end
