json.array!(@orders) do |order|
  json.extract! order, :id, :cart_id, :user_id, :address_id, :status, :delivery_type, :dalivery_date, :pay_type, :active
  json.url order_url(order, format: :json)
end
