json.extract! user, :id, :email, :created_at, :updated_at, :orders, :contact_phone
json.url user_url(user, format: :json)
