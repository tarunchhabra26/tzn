json.array!(@checks) do |check|
  json.extract! check, :id, :isbn, :email, :checkout, :checkin, :status
  json.url check_url(check, format: :json)
end
