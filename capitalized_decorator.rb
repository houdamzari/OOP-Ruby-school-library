require_relative 'nameable'

class CapitalizedDecorator < Nameable
  def correct_name
    correct_name.capitalize
  end
end
