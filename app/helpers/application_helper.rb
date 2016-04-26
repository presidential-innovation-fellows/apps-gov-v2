module ApplicationHelper
  def custom_body_class
    "#{static_page_body_class} #{sign_in_status}"
  end

  def no_users_signed_in?
    !user_signed_in? && !government_user_signed_in?
  end

  private

  def page_slug
    params[:id].gsub("/", "-")
  end

  def sign_in_status
    if user_signed_in? || government_user_signed_in?
      "signed-in"
    end
  end

  def static_page_body_class
    if controller_name == "pages"
      "pages pages-#{page_slug}"
    end
  end
end
