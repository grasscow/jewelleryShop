json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :second_name, :patronymic, :b_date, :m_phone, :email, :gender, :role
  json.url user_url(user, format: :json)
end
