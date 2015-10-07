json.array!(@rec_books) do |rec_book|
  json.extract! rec_book, :id, :Name, :Author, :Description
  json.url rec_book_url(rec_book, format: :json)
end
