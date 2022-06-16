require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom = (classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
  
  def play_hooky
    "¯\(ツ)/¯"
  end
end
