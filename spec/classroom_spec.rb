require './student'
require './classroom'

describe Classroom do
  it 'should have a label' do
    classroom = Classroom.new('1A')
    expect(classroom.label).to eq('1A')
  end

  it 'should have a list of students' do
    classroom = Classroom.new('1A')
    expect(classroom.students).to eq([])
  end

  it 'should add a student to the list of students' do
    classroom = Classroom.new('1A')
    student = Student.new('18', 'n/a', 'John', parent_permission: true)
    classroom.add_student(student)
    expect(classroom.students).to eq([student])
  end
end
