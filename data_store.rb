require 'json'

class DataStore
  def initialize(app, book_list)
    @app = app
    @book_list = book_list
    @people = []
    @rentals = []
  end

  # Function to load books from a JSON file
  def load_books
    if File.exist?("books.json")
      File.open("books.json", "r") do |f|
        @book_list = JSON.load(f)
      end
    else
      @book_list = []
    end
  end

  # Function to load people from a JSON file
  def load_people
    if File.exist?("people.json")
      File.open("people.json", "r") do |f|
        @people = JSON.load(f)
      end
    else
      @people = []
    end
  end

  # Function to load rentals from a JSON file
  def load_rentals
    if File.exist?("rentals.json")
      File.open("rentals.json", "r") do |f|
        @rentals = JSON.load(f)
      end
    else
      @rentals = []
    end
  end

  # Code to load all data on startup
  def load_all_data
    load_books
    load_people
    load_rentals
  end

  # Function to save books to a JSON file
  def save_books
    File.open("books.json", "w") do |f|
      JSON.dump(@book_list, f)
    end
  end

  # Function to save people to a JSON file
  def save_people
    File.open("people.json", "w") do |f|
      JSON.dump(@app.people_list, f)
    end
  end

  # Function to save rentals to a JSON file
  def save_rentals
    File.open("rentals.json", "w") do |f|
      JSON.dump(@app.rental_list, f)
    end
  end

  # Code to save all data on exit
  def save_all_data
    save_books
    save_people
    save_rentals
  end
end
