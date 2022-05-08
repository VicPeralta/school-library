require './person'
require './student'
require './teacher'

my_person = Person.new(50, 'Victor')
my_student = Student.new(25, '101', 'Alejandra')
my_teacher = Teacher.new(30, 'Mathematics', 'Cynthia')
puts "Person name: #{my_person.name}"
puts "Person age: #{my_person.age}"
puts "Can use services?: #{my_person.can_use_services?}"

puts "Student name: #{my_student.name}"
puts "Student age: #{my_student.age}"
puts "Can use services?: #{my_student.can_use_services?}"
puts "Play?: #{my_student.play_hooky}"

puts "Teacher name: #{my_teacher.name}"
puts "Teacher age: #{my_teacher.age}"
puts "Can use services?: #{my_teacher.can_use_services?}"
