require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(25, 'John Doe') }

  describe '#initialize' do
    it 'sets the person\'s age' do
      expect(person.age).to eq(25)
    end

    it 'sets the person\'s name' do
      expect(person.name).to eq('John Doe')
    end

    it 'generates a random ID between 1 and 1000' do
      expect(person.id).to be_between(1, 1000)
    end

    it 'sets parent permission to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end

    it 'initializes an empty array of rentals' do
      expect(person.rentals).to eq([])
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 or older' do
      person = Person.new(18)
      expect(person.send(:of_age?)).to eq(true)
    end

    it 'returns false if the person is younger than 18' do
      person = Person.new(17)
      expect(person.send(:of_age?)).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the person\'s name' do
      expect(person.send(:correct_name)).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is 18 or older' do
      person = Person.new(18)
      expect(person.send(:can_use_services?)).to eq(true)
    end

    it 'returns true if the person is younger than 18 but has parent permission' do
      person = Person.new(17, 'Jane Doe', parent_permission: true)
      expect(person.send(:can_use_services?)).to eq(true)
    end

    it 'returns false if the person is younger than 18 and does not have parent permission' do
      person = Person.new(17, 'Jane Doe', parent_permission: false)
      expect(person.send(:can_use_services?)).to eq(false)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the person and adds it to their rentals array' do
      rental = person.send(:add_rental, book, '2023-03-17')
      expect(person.rentals).to include(rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'returns the new rental object' do
      rental = person.send(:add_rental, book, '2023-03-17')
      expect(rental).to be_an_instance_of(Rental)
    end
  end
end
