# frozen_string_literal: true

class RemoveFieldNameFromTableRecipe < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :image, :string
  end
end
