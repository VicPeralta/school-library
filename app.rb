require './valid_date'
require './library'
require './menu'
require './terminal_output'

# This class is responsible to ask and validate user's information

class App
  def initialize
    @library = Library.new
    @menu = Menu.new
  end

  def select_book_from_list
    terminal_puts 'Select a book from the following list by number'
    @library.books.each_with_index do |book, index|
      terminal_puts "#{index}) Title: \"#{book.title}\" Author: #{book.author} "
    end
    gets.chomp.to_i
  end

  def select_person_from_list
    terminal_puts 'Select a person from the following list by number (not id)'
    @library.people.each_with_index do |person, index|
      terminal_print "#{index}) #{person.is_a?(Teacher) ? '[Teacher]' : '[Student]'} "
      terminal_puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def can_create_rental?
    if @library.books.empty?
      terminal_puts 'There are no books for rentals'
      return false
    end
    if @library.people.empty?
      terminal_puts 'There are no people for rentals'
      return false
    end
    true
  end

  def list_rentals
    if @library.rentals.empty?
      terminal_puts 'No Rentals to show'
      return
    end
    terminal_print 'ID of person: '
    id = gets.chomp
    terminal_puts 'Rentals'
    @library.rentals.each do |rental|
      if rental.person.id == id.to_i
        terminal_print("Date: #{rental.date} ")
        terminal_puts("Book \"#{rental.book.title}\" by #{rental.book.author} ")
      end
    end
  end

  def list_books
    if @library.books.empty?
      terminal_puts 'There are no books to show'
      return
    end
    @library.books.each { |book| terminal_puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    if @library.people.empty?
      terminal_puts 'There are no people to show'
      return
    end
    @library.people.each do |person|
      terminal_print '[Teacher] ' if person.is_a?(Teacher)
      terminal_print '[Student] ' if person.is_a?(Student)
      terminal_puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    return unless can_create_rental?

    index_book = select_book_from_list
    if index_book.negative? || index_book >= @library.books.length
      terminal_puts 'Invalid selection'
      return
    end
    index_person = select_person_from_list
    if index_person.negative? || index_person >= @library.people.length
      terminal_puts 'Invalid selection'
      return
    end
    terminal_puts 'Date (yyyy/mm/dd):'
    date = gets.chomp
    if valid_date(date)
      @library.add_rental(date, index_person, index_book)
      terminal_puts 'Rental created successfully'
      return
    end
    terminal_puts 'Invalid date'
  end

  def create_book
    terminal_print 'Title: '
    title = gets.chomp
    terminal_print 'Author: '
    author = gets.chomp
    @library.add_book(title, author)
    terminal_puts 'Book created successfully'
  end

  def new_person
    terminal_print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp.to_i
    return if option < 1 && option > 2

    case option
    when 1
      age, name, permission = student_info
      @library.create_student(age, name, parent_permission: permission)
      terminal_puts 'Person created successfully'
    when 2
      age, name, specialization = teacher_info
      @library.create_teacher(age, specialization, name)
      terminal_puts 'Person created successfully'
    end
  end

  def student_info
    terminal_print 'Age: '
    age = gets.chomp
    terminal_print 'Name: '
    name = gets.chomp
    terminal_print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    [age, name, permission.downcase == 'y']
  end

  def teacher_info
    terminal_print 'Age: '
    age = gets.chomp
    terminal_print 'Name: '
    name = gets.chomp
    terminal_print 'Specialization: '
    specialization = gets.chomp
    [age, name, specialization]
  end

  def save_data
    @library.save_data
  end
  
  def run(option)
    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then new_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    end
  end

  def main_menu
    @menu.main_menu
  end
end
