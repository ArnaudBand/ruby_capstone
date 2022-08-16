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

  def list_all_labels
    if @labels.empty?
      puts 'There are no labels.'
    else
      @labels.each { |label| puts "ID: #{label.id} - Title: #{label.title} - Color: #{label.color} " }
    end
    puts menu_option
  end

  def add_book
    puts 'Please enter the book information'
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Publisher '
    publisher = gets.chomp
    print 'Cover state (good/bad): '
    cover_state = gets.chomp.downcase
    @books << Book.new(publish_date, publisher, cover_state)
    puts "Book added successfully.\n"
    puts menu_option
  end
end
