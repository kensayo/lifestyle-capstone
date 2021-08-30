class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @category = Category.all.order('priority ASC').limit(4)
    @header = Recipe.find(Vote.most_voted) unless Recipe.all.empty?
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @category = Category.find(params[:id]).recipes.order('created_at DESC')
  end
end
