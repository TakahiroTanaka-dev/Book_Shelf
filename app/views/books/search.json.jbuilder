json.array! @books do |book|
  json.id book.id
  json.name book.name
  json.author book.author
  json.text book.text
  json.image book.image.url
end