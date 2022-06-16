require './student'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @student << student unless student.include?(student)
    student.classroom = self
  end
end
