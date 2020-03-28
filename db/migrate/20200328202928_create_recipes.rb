class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :thumbnail
      t.string :image
      t.string :url
      t.string :name
      t.string :byline
      t.string :cooking_time

      t.timestamps
    end
  end
end
