class Main
  def initialize
    @app = App.new
  end

  def run
    puts 'Welcome to School Library App !'
    loop do
      display_menu_options
      option = gets.chomp

      case option
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rentals
      when '7'
        break
      else
        puts 'That is not a valid option'
      end

      puts ' '
      puts 'Press any key to continue'
      gets.chomp
    end

    puts 'Thank you for using this app!'
  end

  private

  def display_menu_options
    puts 'Please choose an option by entering a number :'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end
end
