
require './app'

def main
  app = App.new
  app.run
  # main_menu
  # classroom = Classroom.new('102')
  # student1 = Student.new(50, classroom, 'Victor')
  # student2 = Student.new(25, classroom, 'Alejandra')
  # puts 'Students in classroom'
  # puts classroom.students.map(&:name)
  # book = Book.new('C++ Programming', 'Victor Peralta')
  # Rental.new('2022/05/09', student1, book)
  # Rental.new('2022/05/09', student2, book)
  # puts 'Rentals in students'
  # puts(student1.rentals.map { |rental| "#{rental.date}, #{rental.person.name}, #{rental.book.title}" })
  # puts 'Rentals in books'
  # puts(book.rentals.map { |rental| "#{rental.date}, #{rental.person.name}, #{rental.book.title}" })
end

main