class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user: current_user, name: category_params[:name], icon: category_params[:icon])
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, alert: 'Category was not created.'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
