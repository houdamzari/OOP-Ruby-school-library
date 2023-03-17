require_relative 'book'
require_relative 'rental'
require_relative 'person'
require 'rspec'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(20, 'Alice') }

  describe '#initialize' do
    it 'creates a new book with a title and an author' do
      expect(book.title).to eq 'The Great Gatsby'
      expect(book.author).to eq 'F. Scott Fitzgerald'
    end

    it 'creates a new book with an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental instance' do
      rental = book.add_rental(person, '2023-03-17')
      expect(rental).to be_an_instance_of Rental
      expect(rental.date).to eq '2023-03-17'
      expect(rental.book).to eq book
      expect(rental.person).to eq person
    end

    it 'adds the new rental to the rentals array' do
      expect { book.add_rental(person, '2023-03-17') }.to change { book.rentals.length }.by(1)
      expect(book.rentals.first.person).to eq person
    end
  end
end
