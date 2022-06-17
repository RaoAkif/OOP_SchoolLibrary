#!/usr/bin/env ruby
require './app'

class Main
  def initialize
    @app = App.new
  end

  def interface
    puts "Welcome to School Library App!\n\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option
  end

  def option # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    option = gets.chomp.to_i
    case option
    when 1
      @app.list_all_books
      interface
    when 2
      @app.list_all_people
      interface
    when 3
      @app.create_person
      interface
    when 4
      @app.create_book
      interface
    when 5
      @app.create_rental
      interface
    when 6
      @app.list_all_rentals_by_person_id
      interface
    when 7
      puts 'Goodbye!'
      exit
    else
      puts 'Invalid option!'
      interface
    end
  end
end

Main.new.interface
