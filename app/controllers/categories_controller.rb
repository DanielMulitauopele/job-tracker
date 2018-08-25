class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def destroy
    Category.destroy(params[:id])
    redirect_to '/categories'
  end
  def show
    # require "pry"; binding.pry
    @category = Category.find(params[:id])
  end
end
