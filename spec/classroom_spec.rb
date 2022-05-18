require './classroom'

RSpec.describe Classroom do
  classroom = Classroom.new('A')
  it 'The instance should be a Classroom ' do
    expect(classroom).to be_an_instance_of(Classroom)
  end

  it 'Classroom label should be "A" ' do
    expect(classroom.label).to be == 'A'
  end

  it 'Add a student to the class' do
    Student.new(18, classroom, 'Behnam')
    expect(classroom.students.length).to eq 1
  end

  it 'Converting an instance of classroom to a JSON string' do
    expect(classroom.to_json).to be == '{"json_class":"Classroom","label":"A"}'
  end

  it 'Converting a JSON string to an instance of classroom' do
    classroom = JSON.parse('{"json_class":"Classroom","label":"A"}', create_additions: true)
    expect(classroom).to be_an_instance_of(Classroom)
  end
end
