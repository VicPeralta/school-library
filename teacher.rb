require './person'
require 'json'
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ @age, @specialization, @name ]
    }.to_json(*args)
  end

  def self.json_create(object)
    puts 'Teacher'
    unless object['json_class'] != 'Teacher'
      new(*object['a'])
    end
  end
end
