class Teacher
  def initialize(age, specialization, name = 'Unknown')
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
