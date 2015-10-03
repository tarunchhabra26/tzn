json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :title, :description, :author, :status
  json.url book_url(book, format: :json)
end
