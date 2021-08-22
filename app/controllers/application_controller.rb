class ApplicationController < ActionController::Base
  before_action :set_meta

  private

  def set_meta
    @categories = Category.all
  end
end
