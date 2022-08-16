require './classes/book'
require './classes/label'

class App
  def initialize
    @books = []
    @labels = []
  end

  def menu_option
    'Do you want to choose an option in the menu? Please type an option number:
    1. List books
    2. List labels
    3. Create book
    4. Exit
    Please choose an option:'
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books.'
    else
      @books.each do |book|
        puts "ID: #{book.id} - Publisher: \"#{book.publisher}\" - Cover State: #{book.cover_state} "
      end
    end
    puts menu_option
  end
end
