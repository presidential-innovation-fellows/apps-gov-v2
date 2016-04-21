class RegistrationsController < Devise::RegistrationsController
  layout "minimal"

  private

  def account_update_params
    params.require(:user).
      permit(:first_name, :last_name, :email, :password, :current_password)
  end

  def after_sign_up_path_for(user)
    if user_has_govt_email?(user.email)
      registration_government_employee_path
    else
      root_path
    end
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def user_has_govt_email?(email)
    email.match(/(.+\.)?([^.]+)\.(?:gov|mil)$/).present?
  end
end
