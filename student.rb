require './person'
require 'pry'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', id = nil, parent_permission: true)
    self.classroom = classroom
    super(age, name, id, parent_permission: parent_permission)
  end
  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@age, @classroom, @name, @id, @parent_permission]
    }.to_json(*args)
  end

  def self.json_create(object)
    age, classroom, name, id, parent_permission = object['data']
    Student.new(age, classroom, name, id, parent_permission: parent_permission)
  end
end
