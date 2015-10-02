json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :title, :authors, :status, :return_date
  json.url book_url(book, format: :json)
end
