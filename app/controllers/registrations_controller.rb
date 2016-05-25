class RegistrationsController < Devise::RegistrationsController
  layout "minimal"

  private

  def account_update_params
    params.require(:user).
      permit(:first_name, :last_name, :email, :password, :current_password)
  end

  def after_sign_out_path_for(_user)
    root_path
  end

  def after_sign_up_path_for(_user)
    root_path
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
