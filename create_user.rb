require './student'
require './teacher'

module CreateUser
  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      print "\e[2J\e[f"
      add_student
    when '2'
      print "\e[2J\e[f"
      add_teacher
    when '0'
      exit
    else
      invalid_prompt
      add_user
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Classroom: '
    classroom = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''

    student = Student.new(age, name, classroom, parent_permission: parent_permission)

    @store.people << student
    @writer.people(age: age, name: name, parent_permission: parent_permission)

    response('Student')
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @store.people << teacher
    @writer.people(age: age, name: name, specialization: specialization)
    response('Teacher')
  end
end
