class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def destroy
    Category.destroy(params[:id])
    redirect_to '/categories'
  end
end
