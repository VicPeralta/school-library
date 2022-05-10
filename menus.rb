module Menus
  def main_menu
    loop do
      print "\n"
      print "\n"
      puts 'Welcome to School Library App!'
      print "\n"
      puts 'Please choose an option by entering a number:'
      puts '1.- List all books'
      puts '2.- List all people'
      puts '3.- Create a person'
      puts '4.- Create a book'
      puts '5.- Create a rental'
      puts '6.- List all rentals for a given person id'
      puts '7.- Exit'
      option=gets.chomp
      return option.to_i if(option.to_i >=1 && option.to_i<8)
    end
  end

  def create_person
    loop do
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option=gets.chomp
      return option.to_i if(option.to_i >=1 && option.to_i<3)
    end
  end
end