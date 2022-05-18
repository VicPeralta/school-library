require './person'
require './student'
require './classroom'
require 'json'

RSpec.describe Person do
  before :each do
    @student = Student.new(10, Classroom.new('1B'), 'Omar')
  end

  it 'Create an instance of person class' do
    expect(@student).to be_a_kind_of(Person)
  end

  it 'Create an instance of student class' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'Check the classroom label' do
    expect(@student.classroom.label).to eq('1B')
  end

  it 'create JSON string' do
    @student = Student.new('10', Classroom.new('1B'), 'Omar', 53, parent_permission: true)
    json = JSON.generate(@student)
    json = @student.to_json
    expect(json).to eq '{"json_class":"Student","data":["10",{"json_class":"Classroom","label":"1B"},"Omar",53,true]}'
  end
end
