require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom = nil, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
