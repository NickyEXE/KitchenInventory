class AddSearchedToIngredient < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :nyt_searched, :boolean, default: false
  end
end
