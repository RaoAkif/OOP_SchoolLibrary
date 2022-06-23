require 'json'

class Writer
  def initialize()
    @people_file = if File.exist?('people.json')
                     File.open('people.json', 'a')
                   else
                     File.open('people.json', 'w')
                   end
    @books_file = if File.exist?('books.json')
                    File.open('books.json', 'a')
                  else
                    File.open('books.json', 'w')
                  end
    @rentals_file = if File.exist?('rentals.json')
                      File.open('rentals.json', 'a')
                    else
                      File.open('rentals.json', 'w')
                    end
  end

  def people(age:, name:, classroom: 'n/a', parent_permission: true, specialization: nil)
    object = [age, classroom, name, parent_permission, specialization]
    @people_file.write("#{JSON.generate(object)}\n")
  end

  def books(title:, author:)
    object = [title, author]
    @books_file.write("#{JSON.generate(object)}\n")
  end

  def rentals(date:, person_name:, book_title:)
    object = [date, person_name, book_title]
    @rentals_file.write("#{JSON.generate(object)}\n")
  end

  def close_all
    @people_file.close
    @books_file.close
    @rentals_file.close
  end
end