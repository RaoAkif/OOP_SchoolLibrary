class Student < Person
  def initialize(name = 'Unknown', classroom, age, parental_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
