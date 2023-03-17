require_relative 'person'
require_relative 'teacher'
require 'rspec'


RSpec.describe Teacher do
  describe "#can_use_services?" do
    context "when the teacher's age is less than 21" do
      # let(:teacher) { Teacher.new(20, "Mathematics", "John Smith") }
      let(:teacher) { Teacher.new(20, "Mathematics") }

      it "returns false" do
        expect(teacher.can_use_services?).to be false
      end
    end

    context "when the teacher's age is between 21 and 60" do
      # let(:teacher) { Teacher.new(30, "Mathematics", "John Smith") }
      let(:teacher) { Teacher.new(30, "Mathematics") }

      it "returns true" do
        expect(teacher.can_use_services?).to be true
      end
    end

    context "when the teacher's age is greater than 60" do
      # let(:teacher) { Teacher.new(70, "Mathematics", "John Smith") }
      let(:teacher) { Teacher.new(70, "Mathematics") }

      it "returns false" do
        expect(teacher.can_use_services?).to be false
      end
    end
  end

  describe "#specialization" do
    let(:teacher) { Teacher.new(30, "Mathematics") }

    it "returns the teacher's specialization" do
      expect(teacher.specialization).to eq("Mathematics")
    end

    it "can be changed" do
      teacher.specialization = "English"
      expect(teacher.specialization).to eq("English")
    end
  end

  describe "#name" do
    context "when the teacher's name is not provided" do
      let(:teacher) { Teacher.new(30, "Mathematics") }

      it "has the default name 'Unknown'" do
        expect(teacher.name).to eq("Unknown")
      end
    end

    context "when the teacher's name is provided" do
      let(:teacher) { Teacher.new(30, "Mathematics") }

      it "returns the teacher's name" do
        expect(teacher.name).to eq("John Smith")
      end
    end
  end
end
