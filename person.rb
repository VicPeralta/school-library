require './nameable'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission

    @id = id || Random.rand(1..1000)
    @rentals = []
    super()
  end

  # getters
  attr_reader :id, :rentals

  # setters
  attr_accessor :name, :age

  def can_use_services?
    of_age? || parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age >= 18
  end
end
