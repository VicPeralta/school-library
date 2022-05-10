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
end
