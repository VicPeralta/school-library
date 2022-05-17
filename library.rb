require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require 'json'

# This class is responsible to handle adding objects and process user inputs.

class Library
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('101')
    load_data
  end
  attr_reader :rentals, :people, :books

  def load_data
    @books = JSON.parse(File.read('./books.json'), create_additions: true) if File.exist? './books.json'
    @people = JSON.parse(File.read('./people.json'), create_additions: true) if File.exist? './people.json'
    @rentals = JSON.parse(File.read('./rentals.json'), create_additions: true) if File.exist? './rentals.json'
  end

  def save_data
    File.write('books.json', JSON.generate(@books)) if @books.empty? == false
    File.write('people.json', JSON.generate(@people)) if @people.empty? == false
    File.write('rentals.json', JSON.generate(@rentals)) if @rentals.empty? == false
  end

  def add_rental(date, index_person, index_book)
    @rentals.push(Rental.new(date, @people[index_person], @books[index_book]))
  end

  def add_book(title, author)
    @books.push(Book.new(title, author))
  end

  def create_student(age, name, permission)
    @people.push(Student.new(age, @classroom, name, parent_permission: permission))
  end

  def create_teacher(age, specialization, name)
    @people.push(Teacher.new(age, specialization, name))
  end
end
