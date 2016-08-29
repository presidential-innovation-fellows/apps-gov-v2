class SubSubcategoriesController < ApplicationController
  def show
    @categories = Category.all
    @sub_subcategory = SubSubcategory.friendly.find(params[:id])
  end
end
