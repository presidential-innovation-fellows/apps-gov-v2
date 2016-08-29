module CategoryHelper
  def active_subcategory(parent_subcategory, subcategory)
    if parent_subcategory.present? && parent_subcategory == subcategory
      return "usa-current"
    end
  end
end
