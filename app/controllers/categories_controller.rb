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
    # require 'pry'; binding.pry
  end
  #
  def edit
    @category = Category.find(params[:id])
    @category.update()
    @category.save
  end
  #
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end
  

end
