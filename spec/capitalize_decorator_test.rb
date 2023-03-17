require_relative '../nameable.rb'
require_relative '../capitalized_decorator'
require 'rspec'

describe CapitalizedDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { CapitalizedDecorator.new(nameable) }

  describe '#correct_name' do
    context 'when the nameable object has a lowercase name' do
      it 'capitalizes the correct name' do
        allow(nameable).to receive(:correct_name).and_return('john')
        expect(decorator.correct_name).to eq('John')
      end
    end

    context 'when the nameable object has an already capitalized name' do
      it 'leaves the name capitalized' do
        allow(nameable).to receive(:correct_name).and_return('Mary')
        expect(decorator.correct_name).to eq('Mary')
      end
    end
  end
end
