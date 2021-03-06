class CategoriesController < ApplicationController
  # before_action :set_category, only: [:show, :destroy, :edit, :update]

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
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

private

  def category_params
    params.require(:category).permit(:title)
  end
end
