json.extract! product, :id, :user_id, :name, :stock, :price, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
