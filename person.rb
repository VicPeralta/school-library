require './nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    super()
  end

  # getters
  attr_reader :id

  # setters
  attr_accessor :name, :age

  def can_use_services?
    of_age? || parent_permission
    correct_name
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age >= 18
  end
end
