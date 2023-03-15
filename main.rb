require './app'
require_relative 'interface'
require_relative 'data_store'

class Main
  def initialize
    @app = App.new
    @data_store = DataStore.new(@app, @app.book_list)
  end

  def run
    # load data from files
    @data_store.load_all_data
    
    # start the interface
    Interface.new(@app).start

    # save data to files on exit
    at_exit do
      @data_store.save_all_data
    end
  end
end

main = Main.new
main.run
