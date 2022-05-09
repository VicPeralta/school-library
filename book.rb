require './rental'
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  
  attr_reader :rentals
  attr_accessor :title
  attr_accessor :author

  def add_rental(rental)
    @rentals = rental
  end
end
