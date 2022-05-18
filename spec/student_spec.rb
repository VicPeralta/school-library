require './person'
require './student'
require './classroom'
require 'json'

RSpec.describe Student do
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

  it 'Create JSON string' do
    @student = Student.new('10', Classroom.new('1B'), 'Omar', 53, parent_permission: true)
    json = JSON.generate(@student)
    expect(json).to eq '{"json_class":"Student","data":["10",{"json_class":"Classroom","label":"1B"},"Omar",53,true]}'
  end

  it 'Creating a student instance from a json string' do
    student = JSON.parse(
      '{"json_class":"Student","data":["10",{"json_class":"Classroom","label":"1B"},"Omar",53,true]}',
      create_additions: true
    )
    expect(student).to be_an_instance_of(Student)
  end

  it 'Playing hooky' do
    expect(@student.play_hooky).to be == '¯\(ツ)/¯'
  end
end
