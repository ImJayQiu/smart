json.array!(@users) do |user|
  json.extract! user, :id, :code, :email, :name, :surname, :gender, :passport, :birthday, :city, :province, :country, :role
  json.url user_url(user, format: :json)
end
