require 'rspec'
require_relative 'person'
require_relative 'classroom'
require_relative 'student'

RSpec.describe Student do
  describe '#add_classroom' do
    let(:student) { Student.new(15, 'John') }
    let(:classroom) { Classroom.new('History 101') }

    context 'when the student is not already in the classroom' do
      it 'adds the student to the classroom' do
        student.add_classroom(classroom)
        expect(classroom.students).to include(student)
      end
    end

    context 'when the student is already in the classroom' do
      before { classroom.add_student(student) }

      it 'does not add the student to the classroom again' do
        student.add_classroom(classroom)
        expect(classroom.students.count(student)).to eq(1)
      end
    end
  end

  describe '#play_hooky' do
    let(:student) { Student.new(15, 'John') }

    it 'returns a shrug emoticon' do
      expect(student.play_hooky).to eq('¯\_(ツ)_/¯')
    end
  end
end
