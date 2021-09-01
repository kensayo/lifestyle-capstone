class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user_id, uniqueness: { scope: :recipe_id, message: 'Already voted' }

  def self.most_voted
    recipe = Vote.select(:recipe_id).group(:recipe_id).count.max_by { |_k, v| v }
    recipe.nil? ? 1 : recipe[0]
  end

  def self.number_votes
    "(#{all.count})"
  end
end
