require './app'
# Its responsability is to start the code and ask the user for the initial code

def main
  app = App.new
  print "\n\nWelcome to School Library App!\n"
  loop do
    option = app.main_menu
    break if option == 7

    app.run(option)
  end
  app.save_data
  puts 'Thank you for using this App!'
end

main
