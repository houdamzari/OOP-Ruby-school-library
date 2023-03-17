# Import required modules
require_relative '../person'
require 'test/unit'

# Define test case class
class TestTeacher < Test::Unit::TestCase
  # Test the initialization of the Teacher class
  def test_initialization
    teacher1 = Teacher.new(30, 'Mathematics', 'John Doe')
    assert_equal(teacher1.age, 30)
    assert_equal(teacher1.specialization, 'Mathematics')
    assert_equal(teacher1.name, 'John Doe')
    assert_equal(teacher1.parent_permission, true)

    teacher2 = Teacher.new(40, 'Science', parent_permission: false)
    assert_equal(teacher2.age, 40)
    assert_equal(teacher2.specialization, 'Science')
    assert_equal(teacher2.name, 'Unknown')
    assert_equal(teacher2.parent_permission, false)
  end

  # Test the can_use_services? method of the Teacher class
  def test_can_use_services
    teacher1 = Teacher.new(25, 'Art')
    assert_false(teacher1.can_use_services?)

    teacher2 = Teacher.new(35, 'Chemistry')
    assert_true(teacher2.can_use_services?)
  end

  # Test the name method of the Teacher class
  def test_name
    teacher1 = Teacher.new(28, 'History')
    assert_equal(teacher1.name, 'Unknown')

    teacher2 = Teacher.new(50, 'English', 'Alice')
    assert_equal(teacher2.name, 'Alice')
  end
end
