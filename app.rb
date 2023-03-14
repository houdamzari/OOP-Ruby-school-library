require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'

class App

  BOOKS_EMPTY = 'There are no books yet'
  NO_BOOK_RECORD = 'No book record found'
  NO_PERSON_RECORD = 'No person record found'

  attr_reader :people_list, :book_list, :rental_list

  def initialize
    @people_list = []
    @book_list = []
    @rental_list = []
  end

  def list_books
    if @book_list.empty?
      puts BOOKS_EMPTY
    end

    else
      @book_list.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    unless @people_list.empty?
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    else
      puts 'There is no people'
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    input_result = gets.chomp.to_sym

    case input_result
    when :1
      create_student
    when :2
      create_teacher
    else
      puts 'Invalid input'
    end
  end

  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp.downcase == 'y'

    student = Student.new(age, name, parent_permission: permission)
    @people_list << student
    puts 'Student Created Successfully'
  end


  def create_teacher
    print 'Specialization:'
    specialization = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i

    print 'Name:'
    name = gets.chomp

    @people_list << Teacher.new(age, name, specialization: specialization)
    puts 'Teacher Created Successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book_list << book

    puts 'Book created successfully'
  end

  def create_rental
    if @book_list.empty?
      puts NO_BOOK_RECORD
    elsif @people_list.empty?
      puts No person record found
    else
      puts 'Select a book from the following list by number '
      @book_list.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number '
      @people_list.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name : #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rental_list << Rental.new(date, @book_list[book_index], @people_list[person_index])
      puts 'Rental created successfully '
    end
  end

  def list_rentals
    print 'ID of person : '
    id = gets.chomp.to_i

    rentals = @rental_list.filter { |rental| rental.person.id == id }

    puts 'Rentals :'
    rentals.each do |rental|
      puts "Date : #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
