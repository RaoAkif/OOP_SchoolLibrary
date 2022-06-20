require './student'
require './teacher'
require './book'
require './rental'
require './person'

class App
  attr_accessor :list_people, :list_books, :rentals

  def initialize
    @list_people = []
    @list_books = []
    @rentals = []
  end

  def create_book
    puts 'Enter the name of the book:'
    name = gets.chomp
    puts 'Enter the author of the book:'
    author = gets.chomp
    puts 'Book created!'
    puts "\n\n"
    book = Book.new(name, author)
    @list_books.push(book)
  end

  def list_all_books
    puts 'List of all books:'
    puts "\n\n"
    list_books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n\n"
  end

  def create_person # rubocop:disable Metrics/MethodLength
    puts 'Do you want to create a Student (1) or a Teacher (2)?'
    option = gets.chomp.to_i
    case option
    when 1
      puts 'Enter the name of the student:'
      name = gets.chomp
      puts 'Enter the age of the student:'
      age = gets.chomp.to_i
      puts 'Has the student a parent permission? [y/n]'
      parent_permission = gets.chomp.downcase == 'y'
      puts 'Student created!'
      puts "\n\n"

      student = Student.new(age, name, parent_permission: parent_permission)
      @list_people.push(student)
    when 2
      puts 'Enter the name of the teacher:'
      name = gets.chomp
      puts 'Enter the age of the teacher:'
      age = gets.chomp.to_i
      puts 'Enter the specialization of the teacher:'
      specialization = gets.chomp
      puts 'Teacher Created!'
      puts "\n\n"

      teacher = Teacher.new(age, name, specialization, parent_permission: true)
      @list_people.push(teacher)
    end
  end

  def list_all_people
    puts 'List of all people:'
    puts "\n\n"
    list_people.each do |person|
      puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    puts "\n\n"
  end

  def create_rental
    puts 'select a book from the following list by number (not ID):'
    list_books.each_with_index do |book, index|
      puts "[#{index}] Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'select a person from the following list by number (not ID):'
    list_people.each_with_index do |person, index|
      puts "[#{index}] [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Enter the Date of rental (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, list_books[book_index], list_people[person_index])
    @rentals.push(rental)

    puts 'Rental created!'
  end

  def list_all_rentals_by_person_id
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    puts "List of all rentals for the person with ID: #{id}"
    puts "\n\n"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
    puts "\n\n"
  end
end
