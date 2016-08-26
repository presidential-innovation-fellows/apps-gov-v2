class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.friendly.find(params[:id])
  end
end
