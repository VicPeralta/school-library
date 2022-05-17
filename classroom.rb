require './student'

class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label
  attr_reader :students

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    # we make sure that when adding a student
    # the classroom is set in the student as well
    student.classroom = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'label' => [@label]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['label'])
  end
end
