class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to '/categories'
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
    @category.update
  end

end
