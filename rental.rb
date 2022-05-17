require './person'
require './book'

class Rental
  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    person.add_rental(self)
    book.add_rental(self)
  end

  attr_accessor :date, :book, :person

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@date, @person, @book]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
