module DeviseHelper
  def devise_mapping
    Devise.mappings[:user]
  end

  def hours_since_sign_up
    (((signed_in_user.created_at + 2.days) - Time.now) / 3600).round * 1
  end

  def signed_in_user
    current_user || current_government_user || current_product_owner
  end
end
