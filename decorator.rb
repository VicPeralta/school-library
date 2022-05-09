require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end
  attr_reader :nameable

  def correct_name
    @nameable.correct_name
  end
end
