require './person'

RSpec.describe Person do
  before :each do
    @person = Person.new(18, 'jose')
  end

  it 'Create an instance of person class' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'Check age' do
    expect(@person.age).to eq 18
  end

  it 'Check name' do
    expect(@person.name).to eq('jose')
  end

  it 'Check if person can use the services' do
    expect(@person.can_use_services?).to eq(true)
  end

  it 'Throws error if incorrect number of parameters' do
    expect { Person.new }.to raise_error(ArgumentError)
  end

  it 'Has a valid ID' do
    expect(@person.id).to be_between(1, 1000).inclusive
  end
end
