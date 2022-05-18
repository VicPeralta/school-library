require './book'
require './rental'
require './student'
require './classroom'
require 'json'

RSpec.describe Book do
  before :each do
    @book = Book.new('Ruby Programming', 'Victor')
  end

  it 'Add a rental to book' do
    classroom = Classroom.new('101')
    expect(@book.rentals.length).to be == 0
    rental = Rental.new('2022/05/18', Student.new(23, classroom, 'Victor'), @book)
    @book.add_rental(rental)
    expect(@book.rentals.length).to be == 2
  end

  it 'Create an instance of Book' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Check title' do
    expect(@book.title).to be == 'Ruby Programming'
  end

  it 'Check Author' do
    expect(@book.author).to eq 'Victor'
  end

  it 'Throws if incorrect number of parameters' do
    expect { Book.new }.to raise_error(ArgumentError)
  end

  it 'Create JSON string' do
    json = JSON.generate(@book)
    expect(json).to eq '{"json_class":"Book","data":["Ruby Programming","Victor"]}'
  end

  it 'Create an instance from json string' do
    book = JSON.parse('{"json_class":"Book","data":["Ruby Programming","Victor"]}', create_additions: true)
    expect(book).to be_an_instance_of(Book)
  end
end
