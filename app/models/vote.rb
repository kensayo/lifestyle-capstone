class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user_id, uniqueness: {scope: :recipe_id, message: 'Already voted'}

  def self.exist?(user, recipe)
    if Vote.find_by(user_id:user).recipe_id == recipe
      return true
    end
    false
  end
end
