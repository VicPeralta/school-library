require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    self.classroom = classroom
    super(age, name, parent_permission: parent_permission)
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
      JSON.create_id  => self.class.name,
      'data'             => [ @age,  @name, @parent_permission ],
      'classroom' => [@classroom]
    }.to_json(*args)
  end

  def self.json_create(object)
    print object['data'][0]
    print object['data'][1]
    print object['data'][2]
    puts object['classroom']
    unless object['json_class']!='Student'
      # new(*object['a'])
    end
  end
end
