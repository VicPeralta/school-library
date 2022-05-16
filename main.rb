require './app'
# Its responsability is to start the code and ask the user for the initial code
# App class it responsible for creating and managing the different objects that make the application
# Class Library, it is going to contain the book, people, rentals etc.

def main
  app = App.new
  print "\n\nWelcome to School Library App!\n"
  loop do
    option = app.main_menu
    break if option == 7

    app.run(option)
  end
  puts 'Thank you for using this App!'
end

main
