class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :vote
  has_one_attached :image
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  def self.last_recipes
    recipe = []
    Category.all.each do |last|
      recipe.append last.recipes.last
    end
    recipe
  end
end
