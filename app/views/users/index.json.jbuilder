json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :email, :sec_que, :ans
  json.url user_url(user, format: :json)
end
