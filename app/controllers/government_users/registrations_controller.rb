class GovernmentUsers::RegistrationsController < RegistrationsController
  respond_to :html, :json
  layout "minimal"

  def create
    if user_has_gov_email?(params[:government_user][:email])
      super
    else
      flash[:error] = I18n.t("government_users.failures.no_gov_email")
      redirect_to new_government_user_registration_path
    end
  end

  private

  def account_update_params
    params.require(:government_user).
      permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :agency,
        :current_password)
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def sign_up_params
    params.require(:government_user).
      permit(:agency_id, :first_name, :last_name, :email, :password)
  end

  def user_has_gov_email?(email)
    email.match(/(.+\.)?([^.]+)\.(?:gov|mil)$/).present?
  end
end
