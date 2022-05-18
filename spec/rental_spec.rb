require './rental'
require './book'
require './teacher'
require './student'
require 'json'

RSpec.describe Rental do
  before :each do
    @teacher = Teacher.new(50, 'All', 'Victor')
    @book = Book.new('C++ Programming', 'Victor')
    @rental = Rental.new('2022/05/18', @teacher, @book)
  end

  it 'Create a Rental instance' do
    expect(@rental).to be_an_instance_of(Rental)
  end

  it 'Create a Rental instance from a json string' do
    json = JSON.generate(@rental)
    rental = JSON.parse(json, create_additions: true)
    expect(rental).to be_an_instance_of(Rental)
  end

  it 'Fails with incorrect number of arguments' do
    expect { Rental.new('2022/05/18') }.to raise_error(ArgumentError)
  end
end
