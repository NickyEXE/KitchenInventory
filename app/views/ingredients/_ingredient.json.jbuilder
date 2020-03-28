json.extract! ingredient, :id, :name, :quantity, :container, :kind, :sub_kind, :perishable, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
