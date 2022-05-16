require './person'
require './student'
require './teacher'
require './book'
require './capitalize_decorator'
require './trimmer_decorator'
require './classroom'
require './menu'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('101')
    @menu = Menu.new
  end

  attr_reader :rentals, :people, :books

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

  def create_rental(date, index_person, index_book)
    @rentals.push(Rental.new(date, @people[index_person], @books[index_book]))
  end

  def list_rentals
    if @rentals.empty?
      puts 'No Rentals to show'
      return
    end
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == id.to_i
        print("Date: #{rental.date} ")
        puts("Book \"#{rental.book.title}\" by #{rental.book.author} ")
      end
    end
  end

  def create_book(title, author)
    @books.push(Book.new(title, author))
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

  def create_person(person)
    @people.push(person)
    puts 'Person created successfully'
  end

  def main_menu
    @menu.main_menu
  end

  def run(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      new_person
    end
  end

  def new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp.to_i
    return option.to_i if option < 1 && option > 2

    case option
    when 1
      age, name, permission = student_info
      newperson = Student.new(age, @classroom, name, parent_permission: permission)
      create_person(newperson)
    when 2
      age, name, specialization = teacher_info
      newperson = Teacher.new(age, specialization, name)
      create_person(newperson)
    end
  end

  def student_info
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    [age, name, permission.downcase == 'y']
  end

  def teacher_info
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    [age, name, specialization]
  end
end
