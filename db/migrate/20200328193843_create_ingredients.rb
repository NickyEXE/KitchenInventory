class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :quantity
      t.string :container
      t.string :kind
      t.string :sub_kind, default: "none"
      t.boolean :perishable
      t.timestamps
    end
  end
end
