class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @category = Category.all.order('priority ASC').limit(4)
    @header = Recipe.find(Vote.most_voted) unless Recipe.all.empty?
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_recipe_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id]).recipes.order('created_at DESC')
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
