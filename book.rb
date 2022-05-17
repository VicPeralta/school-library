require './rental'
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_reader :rentals
  attr_accessor :title, :author

  def add_rental(rental)
    @rentals.push(rental)
  end

  # def to_json(*args)
  #   {
  #     'data'          => [ title, author ]
  #   }.to_json(*args)
  # end

  def to_json(*_args)
    JSON.dump({
                title: @title,
                author: @author
              })
  end

  # def self.json_create(object)
  #   puts 'Books'
  #   puts object
  #   new(*object['data'])
  # end

  def self.from_json(data)
    new(data['title'], data['author'])
  end
end
