require './student'

describe Student do
  it 'should have a name' do
    student = Student.new('18', '', 'John', parent_permission: true)
    expect(student.name).to eq('John')
  end

  it 'should have an id' do
    student = Student.new('18', '', 'John', parent_permission: true)
    expect(student.id.class).to eq(String)
  end

  it 'should have an age' do
    student = Student.new('18', '', 'John', parent_permission: true)
    expect(student.age).to eq(18)
  end

  it 'should have a parent permission' do
    student = Student.new('18', '', 'John', parent_permission: true)
    expect(student.parent_permission).to eq(true)
  end

  it 'should have a list of rentals' do
    student = Student.new('18', '', 'John', parent_permission: true)
    expect(student.rentals).to eq([])
  end
end
