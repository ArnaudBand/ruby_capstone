require 'pry'
require 'json'
require 'Date'

require './classes/book'
require './classes/label'

class App
  def initialize
    @books = File.exist?('store/books.json') ? JSON.parse(File.read('store/books.json'), create_additions: true) : []
    @labels = File.exist?('store/labels.json') ? JSON.parse(File.read('store/labels.json'), create_additions: true) : []
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
        puts "ID: #{book.id} - Publisher: \"#{book.publisher}\" - Cover State: #{book.cover_state} - published_date: #{book.publish_date}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are no labels.'
    else
      @labels.each { |label| puts "ID: #{label.id} - Title: #{label.title} - Color: #{label.color} " }
    end
  end

  def use_string(prompt)
    print prompt
    gets.chomp.strip
  end

  def use_date(prompt)
    loop do
      date = Date.parse(use_string(prompt))
    rescue Date::Error
      puts 'Invalid date'
    else
      return date
    end
  end

  def choice_good_or_bad(prompt, valid_options)
    loop do
      input = use_string(prompt).upcase
      return input if valid_options.include?(input)
    end
  end

  def ask_publish_date
    use_date('Publish Date (YYYY-MM-DD): ')
  end

  def ask_publisher
    use_string('Publisher: ')
  end

  def ask_cover_state
    choice_good_or_bad('Cover_state (good/bad): ', %w[GOOD BAD]).downcase
  end

  def ask_book_info
    puts 'Please enter the book information'
    [
      ask_publish_date,
      ask_publisher,
      ask_cover_state
    ]
  end

  def add_book
    publish_date, publisher, cover_state = ask_book_info
    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book added successfully.'
  end

  def save_data
    File.write('store/books.json', JSON.generate(@books))
    File.write('store/labels.json', JSON.generate(@labels))
  end
end
