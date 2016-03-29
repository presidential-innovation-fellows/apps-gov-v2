module ApplicationHelper
  def static_page_body_class
    if controller_name == "pages"
      "pages pages-#{page_slug}"
    end
  end

  private

  def page_slug
    params[:id].gsub("/", "-")
  end
end
