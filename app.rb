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
end
