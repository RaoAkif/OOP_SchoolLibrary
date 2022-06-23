require 'json'
require './book'
require './teacher'
require './student'
require './rental'

class Reader
  def initialize(store)
    @people_file = File.open('people.json', 'r')
    @books_file = File.open('books.json', 'r')
    @rentals_file = File.open('rentals.json', 'r')
    @store = store
    @people = []
    @books = []
    @rentals = []
  end

  def read
    @people_file.each { |line| @people << JSON.parse(line) }
    @people_file.close
    create_people
    @books_file.each { |line| @books << JSON.parse(line) }
    @books_file.close
    create_books
    @rentals_file.each { |line| @rentals << JSON.parse(line) }
    @rentals_file.close
    create_rentals
  end

  private

  def create_people
    @people.each do |person|
      if person[-1]
        teacher = Teacher.new(person[0], person[1], person[2])
        @store.people << teacher
      else
        student = Student.new(person[0], 'n/a', person[1], parent_permission: person[2])
        @store.people << student
      end
    end
  end

  def create_books
    @books.each do |book|
      @store.books << Book.new(book[0], book[1])
    end
  end

  def create_rentals
    @rentals.each do |rental|
      person_name = @store.people.find { |person| person.name == rental[1] }
      book_title = @store.books.find { |book| book.title == rental[2] }
      Rental.new(rental[0], book_title, person_name)
    end
  end
end