class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user: current_user, name: category_params[:name])
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to categories_path
    else
      error = @category.errors.full_messages.join(", ")
      flash[:alert] = error
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
