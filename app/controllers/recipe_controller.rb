class RecipeController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.category_id = Category.find_by(name: params[:category_id]).id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def index
    @main = Recipe.all.last
    @categories = Recipe.last_recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image, :category_id)
  end
end
