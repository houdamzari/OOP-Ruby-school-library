require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, 'teacher', name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    @age >= 21 && @age <= 60
  end

  def name
    @name == 'Unknown' ? 'Unknown' : @name
  end
end
