require './person'
require './nameable'
require './teacher'
require './capitalize_decorator'
require 'json'

RSpec.describe Teacher do
  teacher = Teacher.new('45', 'Math', 'behnam', 645)
  it 'The teacher instance should be a person ' do
    expect(teacher).to be_a_kind_of(Person)
  end

  it 'Create an instance of teacher class' do
    expect(teacher).to be_an_instance_of(Teacher)
  end

  it 'Specialization field should not be accessible ' do
    expect { teacher.specialization }.to raise_error(NoMethodError)
  end

  it 'Converting an nstance of Teacher class to json ' do
    expect(teacher.to_json).to be == '{"json_class":"Teacher","data":["45","Math","behnam",645]}'
  end

  it 'Converting a json string to an instance of Teacher class' do
    teacher = JSON.parse('{"json_class":"Teacher","data":["45","Math","behnam",645]}', create_additions: true)
    expect(teacher).to be_an_instance_of(Teacher)
  end

  it 'Teacher should be nameable' do
    expect(teacher).to be_a_kind_of(Nameable)
  end

  it 'Using decorators teacher name should be able to be capitalized' do
    capitalize_decorator = CapitalizeDecorator.new(teacher)
    expect(capitalize_decorator.correct_name).to be == 'Behnam'
  end
end
