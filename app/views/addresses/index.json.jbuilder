json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :country, :locality, :index, :addres_line, :delete, :main
  json.url address_url(address, format: :json)
end
