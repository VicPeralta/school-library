require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      # 'classroom' => [@classroom],
      'data' => [@age, @specialization, @name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
