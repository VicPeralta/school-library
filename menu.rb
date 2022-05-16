class Menu
  def main_menu
    loop do
      print "\n\n"
      puts 'Please choose an option by entering a number:'
      puts '1.- List all books'
      puts '2.- List all people'
      puts '3.- Create a person'
      puts '4.- Create a book'
      puts '5.- Create a rental'
      puts '6.- List all rentals for a given person id'
      puts '7.- Exit'
      option = gets.chomp.to_i
      return option if option >= 1 && option < 8
    end
  end

  def create_person_menu
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
      option = gets.chomp.to_i
      return option.to_i if option >= 1 && option < 3
    end
  end
end
