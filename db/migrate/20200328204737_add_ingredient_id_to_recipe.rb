class AddIngredientIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredient_id, :integer
  end
end
