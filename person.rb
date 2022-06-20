require './nameable'
require './decorator'
require './rental'
require './book'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name?
    @name
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def rent(rental)
    @rental << rental
  end
end
