require './store'
require './helpers'
require './create_user'
require './list'
require './add'
require './book'
require './person'
require './teacher'
require './student'
require './rental'
require './writer'
require './reader'

class App
  attr_reader :store

  include Helpers
  include CreateUser
  include List
  include Add

  def initialize
    @store = Store.new
    begin
      Reader.new(@store).read
    rescue Errno::ENOENT
      puts 'No data file found.'
    end
    @writer = Writer.new
  end

  def run
    puts 'Welcome to School Library App!'
    select_option
  end

  def select_option
    options
    input = gets.chomp

    if input.to_i.between?(1, 6)
      print "\e[2J\e[f"
      selection(input)
    elsif input == '0'
      @writer.close_all and abort('Thanks for using this App. Goodbye!')
    else
      invalid_prompt
      select_option
    end
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - Create a user'
    puts '2 - Create a book'
    puts '3 - Create a rental'
    puts '4 - List all books'
    puts '5 - List all people'
    puts '6 - List all rentals by user id'
    puts '0 - Exit'
  end

  def selection(input)
    case input
    when '1'
      add_user
    when '2'
      add_book
    when '3'
      add_rental
    when '4'
      list_all_books
    when '5'
      list_all_people
    when '6'
      list_all_rental_by_id
    end
  end
end