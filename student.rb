require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    # classroom.students.push(self) unless classroom.students.include?(self)
    super(age, name, parent_permission: parent_permission)
  end
  attr_reader  :classroom
  
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
