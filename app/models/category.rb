class Category < ApplicationRecord
  has_many :recipes

  validates :name, presence: true, length: 3..12, uniqueness: true
  validates :priority, presence: true

  scope :names, -> { pluck(:name) }
end
