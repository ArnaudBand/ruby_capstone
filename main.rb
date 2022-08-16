require_relative './app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end

  def menu
    loop do
      option = gets.chomp.to_i
      case option
      when 1 then @app.list_all_books
      when 2 then @app.list_all_labels
      when 3 then @app.add_book
      when 4 then exit
      else puts 'Invalid option'
      end
    end
  end
end
