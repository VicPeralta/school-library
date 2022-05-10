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
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('101')
  end

  def run_menu
    loop do
      option = main_menu
      case option
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals
      else
        puts 'Thanks for using this app!'
        return
      end
    end
  end

  def run
    print "\n\nWelcome to School Library App!\n"
    run_menu
  end

  def select_book_from_list
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\" Author: #{book.author} "
    end
    gets.chomp.to_i
  end

  def select_person_from_list
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      print "#{index}) #{person.is_a?(Teacher) ? '[Teacher]' : '[Student]'} "
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def can_create_rental?
    if @books.empty?
      puts 'There are no books for rentals'
      return false
    end
    if @people.empty?
      puts 'There are no people for rentals'
      return false
    end
    true
  end

  def valid_date(date)
    y, m, d = date.split '/'
    return true if (y.to_i > 2000) && (m.to_i > 1 || m.to_i < 12) && (d.to_i > 1 || d.to_i < 31)

    false
  end

  def create_rental
    return unless can_create_rental?

    index_book = select_book_from_list
    if index_book.negative? || index_book >= @books.length
      puts 'Invalid selection'
      return
    end
    index_person = select_person_from_list
    if index_person.negative? || index_person >= @people.length
      puts 'Invalid selection'
      return
    end
    puts 'Date (yyyy/mm/dd):'
    date = gets.chomp
    if valid_date(date)
      @rentals.push(Rental.new(date, @people[index_person], @books[index_book]))
      puts 'Rental created successfully'
      return
    end
    puts 'Invalid date'
  end

  def list_rentals
    return if @rentals.empty?

    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == id.to_i
        print("Date: #{rental.date} ")
        print("Book \"#{rental.book.title}\" by #{rental.book.author} ")
      end
    end
  end

  def create_person
    sub_option = create_person_menu
    add_student if sub_option == 1
    add_teacher if sub_option == 2
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_books
    if @books.empty?
      puts 'There are no books to show'
      return
    end
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    if @people.empty?
      puts 'There are no people to show'
      return
    end
    @people.each do |person|
      print '[Teacher] ' if person.is_a?(Teacher)
      print '[Student] ' if person.is_a?(Student)
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts 'Person created successfully'
  end

  def add_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permision? [Y/N]: '
    permission = gets.chomp
    @people.push(Student.new(age, @classroom, name, parent_permission: permission.downcase == 'y'))
    puts 'Person created successfully'
  end
end
