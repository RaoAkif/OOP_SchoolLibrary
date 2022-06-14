class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = "Unknown", age, parental_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private
    def is_of_age?
      @age >= 18
    end

  public
    def can_use_services?
      is_of_age? || @parent_permission
    end
end
