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

  def run
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
        puts 'Create a rental'
      when 6
        list_rentals
      else
        puts 'Thanks for using this app!'
        return
      end
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'There are no rentals to show'
      return
    end
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals'
    @rentals.each do |rental|
      print("Date: #{rental.date}, Book \"#{book.title}\" by #{book.author} ") if rental.person.id == id
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
