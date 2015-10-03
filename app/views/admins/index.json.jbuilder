json.array!(@admins) do |admin|
  json.extract! admin, :id, :fname, :lname, :email, :sec_que, :ans
  json.url admin_url(admin, format: :json)
end
