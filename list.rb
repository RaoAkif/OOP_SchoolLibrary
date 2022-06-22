module List
  def list_all_books
    @booklist.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    select_option
  end

  def list_all_rental_by_id
    print "\e[2J\e[f"
    @list_people.each do |user|
      puts "[#{user.class}] | Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    print 'Select ID of a person from above list: '
    user_id = gets.chomp.to_i

    puts "Rentals against #{user_id} are:"
    @rentals.each do |rental|
      if rental.person.id == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
      | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    continue?
  end

  def list_all_people
    @list_people.each do |user|
      puts "[#{user.class}] | Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    select_option
  end
end
