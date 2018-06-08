json.extract! food, :id, :name, :food_type, :image, :price, :created_at, :updated_at
json.url food_url(food, format: :json)
