require 'json'

class RentalJSON
  FILENAME = 'rentals.json'

  def self.load_all(books, people)
    if File.exist?(FILENAME)
      json_data = File.read(FILENAME)
      rentals_data = JSON.parse(json_data, symbolize_names: true)
      rentals_data.map do |rental_data|
        book = books.find { |b| b.title == rental_data[:book_title] }
        person = people.find { |p| p.name == rental_data[:person_name] }
        Rental.new(rental_data[:date], book, person)
      end
    else
      []
    end
  end

  def self.save_all(rentals)
    rentals_data = rentals.map do |rental|
      {
        book_title: rental.book.title,
        person_name: rental.person.name,
        date: rental.date
      }
    end

    File.write(FILENAME, JSON.pretty_generate(rentals_data))
  end
end
