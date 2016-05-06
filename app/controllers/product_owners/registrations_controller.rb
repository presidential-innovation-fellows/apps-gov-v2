module ProductOwners
  class RegistrationsController < RegistrationsController
    respond_to :html, :json
    layout "minimal"

    private

    def account_update_params
      params.require(:product_owner).
        permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :current_password)
    end

    def sign_up_params
      params.require(:product_owner).
        permit(:first_name, :last_name, :email, :password)
    end
  end
end
