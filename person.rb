class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = 0
  end

  # getters
  attr_reader :id

  # setters
  attr_accessor :name, :age

  def can_use_services?
    of_age? || parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
