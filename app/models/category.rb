class Category < ApplicationRecord
  has_many :recipes

  scope :names, -> { pluck(:name) }
end
