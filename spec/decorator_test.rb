require 'rspec'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name on the wrapped object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
