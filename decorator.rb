require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end
  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end
