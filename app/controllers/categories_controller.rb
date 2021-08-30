class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @category = Category.all.order('priority ASC')
    @header = Recipe.find(Vote.most_voted)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @category = Category.find(params[:id]).recipes.order('created_at DESC')
  end
end
