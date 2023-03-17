require 'rspec'
require_relative 'book'
require_relative 'rental'
require_relative 'person'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(20, 'Alice') }
  let(:rental) { Rental.new('2023-03-17', book, person) }

  describe '#initialize' do
    it 'creates a new rental with a date, a book, and a person' do
      expect(rental.date).to eq '2023-03-17'
      expect(rental.book).to eq book
      expect(rental.person).to eq person
    end

    it 'adds the new rental to the book rentals array' do
      expect(book.rentals).to include rental
    end

    it 'adds the new rental to the person rentals array' do
      expect(person.rentals).to include rental
    end
  end
end
