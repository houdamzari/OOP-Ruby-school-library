# Import the necessary libraries
require 'test/unit'
require_relative '../capitalized_decorator'

# Create the unit test class that inherits from Test::Unit::TestCase
class TestCapitalizedDecorator < Test::Unit::TestCase
  # Define the setup method
  def setup
    @decorator = CapitalizedDecorator.new('john doe')
  end

  # Define the test case for the correct_name method
  def test_correct_name
    assert_equal('John doe', @decorator.correct_name)
  end
end
