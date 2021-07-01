class ChangeIngrediennntsToIngredients < ActiveRecord::Migration
  def change
    rename_column(:recipes, :ingrediennnts, :ingredients)
  end
end
