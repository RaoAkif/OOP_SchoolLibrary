class Teacher
  def initialize(name = "Unknown", specialization, age, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
