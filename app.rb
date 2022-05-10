require './person'
require './student'
require './teacher'
require './book'
require './capitalize_decorator'
require './trimmer_decorator'
require './classroom'
require './menus'

class App
  include Menus
  def run
    loop do
    option = main_menu
    case option
    when 1
      puts "List all books"
    when 2
      puts "List all people"
    when 3
      puts "Create a person"
    when 4
      puts "Create a book"
    when 5
      puts "Create a rental"
    when 6
      puts "List all rentals"
    else
      puts "Thanks bye"
      return 
    end
  end
  end
end