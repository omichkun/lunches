json.(order, :id, :updated_at)
json.first_course order.first_course, :id, :name, :price
json.main_course order.main_course, :id, :name, :price
json.drink order.drink, :id, :name, :price
json.url order_url(order, format: :json)
