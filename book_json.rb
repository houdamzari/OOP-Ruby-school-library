require 'json'

class BookJSON
  FILENAME = 'books.json'

  def self.load_all
    if File.exist?(FILENAME)
      json_data = File.read(FILENAME)
      books_data = JSON.parse(json_data, symbolize_names: true)
      books_data.map { |book_data| Book.new(book_data[:title], book_data[:author]) }
    else
      []
    end
  end

  def self.save_all(books)
    books_data = books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end

    File.write(FILENAME, JSON.pretty_generate(books_data))
  end
end
