class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = 0
  end

  # getters
  attr_reader :id

  attr_accessor :name, :age

  # setters

  def can_use_services?
    @age >= 18 || parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end
end
