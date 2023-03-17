require 'rspec'
require_relative '../classroom'

RSpec.describe Classroom do
  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom = Classroom.new('Math')
      student = double('Student')
      allow(student).to receive(:classroom=)

      expect { classroom.add_student(student) }.to change { classroom.students.count }.by(1)
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end
end
