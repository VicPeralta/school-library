require './person'
require './student'
require './teacher'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(50, 'maximilianus')
puts "Person id:#{person.id}"
puts "Person name: #{person.correct_name}"
capitalized_person = CapitalizeDecorator.new(person)
puts "Person name capitalized: #{capitalized_person.correct_name}"
capitalized_trimmer_person = TrimmerDecorator.new(capitalized_person)
puts "Person name capitalized and trimmed: #{capitalized_trimmer_person.correct_name}"
capitalized_trimmer_person.nameable = person
puts "Person name just trimmed: #{capitalized_trimmer_person.correct_name}"
